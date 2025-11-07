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

# Regex per matchare gli indirizzi IP di classe a

ifconfig | grep -E "inet [0-9]1[01][0-9]|12[0-7]\."

# Regex per marchare gli indirizzi IP di classe b

ifconfig | grep -E "1[2-3][8-9]|1[34][0-9]|1[56][0-9]|19[0-1]"

# Regex per matchare gli indirizzi IP di classe c

grep -E "19[2-9]|2[0-2][0-3]"

# Matchare gli IP classe D 

grep -E "22[4-9]|23[1-9]

# Matchare gli IP di classe E
grep -E "2[45][0-9]"
