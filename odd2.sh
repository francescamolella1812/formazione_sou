#!/bin/bash

end=$1

#controllo per verificare che il numero sia un numero > 0

if [ $end -le 0 ]; then
	echo "Devi inserire un numero maggiore di zero!!"
	exit 1
fi

#controllo per verificare che il numero sia un intero

if [[ $end =~ ^[0-9]+$ ]]; then
	echo "Il numero che hai scelto è un numero intero!!"
else
	echo "Devi inserire un numero intero!!"
	exit 2
fi

for (( i=1; i<=end; i++ )); do
	if (( i%2==0 )); then
		echo "Il numero $i è pari"
	else
		echo "Il numero $i è dispari"
	fi
done
