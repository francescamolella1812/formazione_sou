
read -p "Seleziona un numero: " numero

for ((i=1; i<=numero; i++)); do
	if ((i%2==0)); then
		echo "il numero $i è un numero pari"
	else
		echo "il numero $i è un numero dispari"
 
	fi
done
