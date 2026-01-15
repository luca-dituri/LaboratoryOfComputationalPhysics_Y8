#!/bin/bash

mkdir -p students	#add directory named students, -p avoids problems if it already exists
cd ./students
wget -q "https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1" -O LCP_students.csv	
#download file, with another name
grep "PoD" LCP_students.csv > students_PoD.txt
grep "Physics" LCP_students.csv > students_Physics.txt
# searching PoD and Physics among all the rows in the files, copy the selected rows in the files (created if non-existing)
tail -n +2 LCP_students.csv | cut -d ',' -f 1 | cut -c 1 | sort | uniq -c
# selects the rows starting from the second (no header)| cuts the row with "," delimiter, considers only first item (second name)| considers only the first character (First letter of the second name)| sorts the names | counts the students for each letter 


tail -n +2 LCP_students.csv | cut -d ',' -f 1 | cut -c 1 | sort | uniq -c | sort -nr | head -n 1
# As before, we sort the output numerically, and display the first result

awk 'NR > 1 { group = (NR - 2) % 18 + 1; print > "group_" group ".csv" }' LCP_students.csv
#awk (...) file per elaborare i testi riga per riga
#NR > 1 salta intestazione
# (NR - 2) % 18 trasforma il numero di riga in modulo 18, +1 per partire dal gruppo 1
#print > scrive la riga corrente nel file selezionato dal gruppo considerato
