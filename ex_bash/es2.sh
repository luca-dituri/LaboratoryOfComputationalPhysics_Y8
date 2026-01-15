#!/bin/bash

grep -v "^#" data.csv | tr ',' ' ' > data.txt

# prendo data.csv e tolgo le righe che iniziano per # (metadati iniziali, non li voglio)
# translate "," in " "
# scrivo tutto in data.tcxt

cat data.txt | xargs -n 1 | awk '$1 % 2 == 0 {count++} END {print count}'

# concatenate data from data.txt, prende il contenuto del file
# a partire da ogni riga, la separa in righe con un elemento ciascuna
# per ogni riga controlla se il primo campo della riga (l'unico) è pari (aumenta il count) o dispari, printa risultato finale
# questo avviene con l'operatore % modulo

awk '{
    val = sqrt($1^2 + $2^2 + $3^2);
    limit = 100 * sqrt(3) / 2;
    if (val > limit) 
        greater++; 
    else 
        smaller++;
} 
END {
    print "Maggiori:", greater; 
    print "Minori:", smaller;
}' data.txt

# devo selezionare le righe sulla base del valore di sqrt(x^2+y^2+z^2)
# prendo data.txt le variabili 1,2,3 che sono  xyz faccio i calcoli e conto quali sono maggiori e quali minori

echo "Inserisci il valore di n (numero di copie):"
read n

for i in $(seq 1 $n); do
    awk -v div=$i '{
        for(j=1; j<=NF; j++) 
            printf "%f ", $j/div; 
        print "" 
    }' data.txt > "data_${i}.txt"
done

# ciclo da 1 a n
# chiama la variabile i div nel ciclo --> non vede le variabili shell awk
#per ogni riga, con awk prendo un indice che varia fino a NF (number of fields, numero di elementi per riga)
#stampa come float seguito da spazio il numero contenuto nella colonna j ($j) diviso per la mia div
#vado a capo con " "
#salvo in data_i.txt

