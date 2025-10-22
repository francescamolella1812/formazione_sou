#!/bin/bash

end=$1

for (( i=1; i<=end; i++ )); do
	if (( i%2==0 )); then
		echo "Il numero $i è pari"
	else
		echo "Il numero $i è dispari"
	fi
done
