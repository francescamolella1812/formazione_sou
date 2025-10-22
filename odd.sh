#!bin/bash

read -p "Seleziona un numero: " numero
for i in $(seq 1 $numero); do
	if (( $i%2==0 )); then
		echo " Il numero $i è un numero pari "
	else
		echo " Il numero $i è un numero dispari "
	fi
done
