#!/usr/bin/env bash

set -euo pipefail

# Nome container e immagine

CNAME="echo"
IMAGE="ealen/echo-server:latest"

# Nodi Vagrant come definiti nel Vagrant file

# Definisco i nomi dei due nodi Vagrant che verranno usati per dire su quale VM si agisce"
N1="node1"
N2="node2"

# Comandi helper per eseguire SSH dentro ai nodi con Vagrant

# Questa funzione esegue un comando remoto dentro una VM Vagrant
# shift rimuove il primo argomento, lasciando solo il comando da eseguire;
#vagrant ssh apre una connessione ssh al nodo e esegue il comando passato

run_on() {
  local node="$1"; shift
  vagrant ssh "$node" -c "$*"
}

# Ferma e rimuove il container se esiste sul nodo
# docker ps -a elenca tutti i container anche quelli fermi
# --filter cerca solo quello con il nome esatto
# -q restituisce solo l'id
# xargs -r docker rm -f elimina forzatamente il container se esiste
#run on fa si che questi comandi vengano eseguiti dentro la vm specificata
stop_container() {
  local node="$1"
  run_on "$node" "sudo docker ps -a --filter 'name=^/${CNAME}$' -q | xargs -r sudo docker rm -f"
}


# Avvia il container sul nodo : porta 8080 dentro la VM

# Funzione che avvia il container
# -d esegue in background
# --name gli assegna nome echo
# -p mappa la porta interna 80 del conteiner sulla 8080 della vm
start_container() {
  local node="$1"
  run_on "$node" "sudo docker run -d --name ${CNAME} -p 8080:80 ${IMAGE}"
}

# info visive utili
#funzione per stampare il nome del nodo ed eseguire docker ps filtrando solo il container echo. Mostra solo le colonne id, stato e porte.
# || true serve a non far fallire lo script se non trova container.

status_node() {
  local node="$1"
  echo "${node}"
  run_on "$node" "sudo docker ps --filter 'name=${CNAME}' --format '{{.ID}} {{.Status}} {{.Ports}}' || true"
}
# Cleanup 

# funzione che stampa un messaggio di pulizia e chiama stop_container su entrambi i nodi
# usa || true per non interrompere lo script se uno dei due fallisce.
# trap dice alla shell: se ricevi un segnale INT (ctrl+c) o TERM (terminazione), esegui la funzione cleanup. serve per garantire una chiusura ordinata
cleanup() {
  echo
  echo "Interrotto. Pulizia: stop del container su entrambi i nodi"
  stop_container "$N1" || true
  stop_container "$N2" ||  true
  echo "Fatto."
  exit 0 
}
trap cleanup INT TERM

echo "Verifico che i nodi siano attivi"
vagrant up "$N1" "$N2"

active="$N1"
inactive="$N2"

# pulisco eventuali container residui su entrambi i nodi ed evito conflitti
stop_container "$active" || true
stop_container "$inactive" || true
#avvio il container sul nodo attivo cioè su node1 la prima volta
start_container "$active"
#mostro lo stato del container su entrambi i nodi (uno sarà attivo , l'altro vuoto)
status_node "$N1"
status_node "$N2"

echo
echo " Ping pong ogni 60 s tra ${N1} e ${N2} . Premi CTRL+C per uscire)"
echo

# inizio un ciclo infinito fino a ctrl+c
while true; do
  # attendo 60 secondi (ogni turno di pingpong)
  sleep 60
  stop_container "$active"
  start_container "$inactive"
  status_node "$N1"
  status_node "$N2"
  # swap : scambia i ruoli cioè quello che era attivo diventa inattivo e viceversa. 
  tmp="$active"; active="$inactive"; inactive="$tmp"
done

