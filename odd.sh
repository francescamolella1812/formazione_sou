#!/bin/bash


read -p "Seleziona un numero: " numero

#controllo per verificare che il numero passato in input sia maggiore di zero
if [ $numero -le 0 ]; then  
	echo "Inserisci un numero positivo maggiore di zero!"
	exit 1
fi

#controllo per verificare che il numero sia un numero intero
if [[ $numero =~ ^[0-9]+$ ]]; then
    echo "È un numero intero"
else
    echo "Devi inserire un numero intero!!"
fi


for i in $(seq 1 $numero); do
	if (( $i%2==0 )); then
		echo " Il numero $i è un numero pari "
	else
		echo " Il numero $i è un numero dispari "
	fi
done
