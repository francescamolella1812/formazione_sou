 # OPERATORE OR ||

# L'operatore OR restituisce vero se almeno una delle condizioni è vera. Esempio:

read -p "Inserisci un numero: " n

if [[ $n -lt 0 || $n -gt 100 ]]; then
   echo " Il numero è fuori dall'intervallo 0-100"
else
   echo " Il numero è compreso tra 0 e 100."
fi

# Operatore NOT !

# L'operatore NOT inverte il risultato di una condizione logica. 

read -p " Inserisci il nome di un file: " f

if [ ! -e "file.txt" ]; then
  echo "Il file non esiste"
fi

# OPERATORE AND 

# L'operatore AND (&&) restituisce vero solo se entrambe le condizioni sono vere

read -p "Inserisci un numero:" n

if [[ $n -ge 1 && $n -le 10 ]]; then
   echo " Il numero è compreso tra 1 e 10"
else
   echo " Il numero non è compreso tra 1 e 10"
fi
 
