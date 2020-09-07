#!/bin/bash

TMP_CSVFILE=.tmpcsv.csv
csvFile=$1

cat $csvFile | tr -d '\r' | tr '\t' '|' > $TMP_CSVFILE

echo "[table]"
echo "[thead]"
echo "[tr]"

for h in $(head -1 $TMP_CSVFILE | tr ' ' '_' | tr '|' ' '); do
    echo "[th]$h[/th]" | tr '_' ' '
done

echo "[/tr]"
echo "[/thead]"

echo "[tbody]"
for row in $(tail -n+2 $TMP_CSVFILE | tr ' ' '_'); do
    echo "[tr]"
    for cell in $(echo "$row" | tr ' ' '_' | tr '|' ' '); do
        echo "[td]$cell[/td]" | tr '_' ' '
    done
    echo "[/tr]"
done
echo "[/tbody]"
echo "[/table]"

rm $TMP_CSVFILE
