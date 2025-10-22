
read -p "Seleziona un numero: " numero

if [[ $numero =~ ^[0-9]+$ ]]; then
	echo "Bravo! Hai inserito un numero intero!"
else
	echo "Errore: devi inserire un numero intero, riprova!"
	exit1
fi

if [ $numero -le 0 ]; then
	echo "Errore: deve essere maggiore di zero!"
	exit 2
fi
for ((i=1; i<=numero; i++)); do
	if ((i%2==0)); then
		echo "il numero $i è un numero pari"
	else
		echo "il numero $i è un numero dispari"
 
	fi
done
