#!/usr/bin/env bash

set -euo pipefail

echo "Provisioning: installo ninvaders.."

sudo apt-get update -y
sudo apt-get install -y ninvaders


# Aggiungo un alias comodo per l'utente

echo " alias play='ninvaders'" >> /home/vagrant/.bashrc

# Creo un link diretto chiamato play

sudo ln -sf /usr/games/ninvaders /usr/local/bin/play

# Messaggio di benvenuto

sudo bash -c 'cat > /etc/motd <<MOTD

Terminal Arcade (basic)

Avvia il gioco con: play
Esci dal gioco con: q

MOTD'

echo " Provisioning completato. Entra con 'vagrant ssh' e lancia 'play'."
