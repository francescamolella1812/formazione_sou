#!/bin/bash

# Matchare sequenze alfabetiche di almeno un carattere, sia maiuscole che minuscole"
egrep -i "[az]+" input2.txt

# Togliere tutte le righe di commento di uno script Bash matchando le righe che iniziano con '#' 

egrep -v "^#" input2.txt

# Matchare in un file le righe che contengono sequenze di 'a' ripetute da 3 a 6 volte

egrep "a{3,6}" input2.txt

# Matchare in un file tutte le righe che contengono una delle sequenti parole: apple, pear, orange

egrep "apple|orange|pear" input2.txt 

# IPV4 REGEX : scrivere una o più espressioni regolari che matchino tutti i possibili indirizzi ipv4 in decimal dottet notation

ifconfig | grep "\."


