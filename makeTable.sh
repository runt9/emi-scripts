#!/bin/bash

csvFile=$1

echo "[table]"
echo "[thead]"
echo "[tr]"

for h in $(head -1 $csvFile | tr ',' ' '); do
    echo "[th]$h[/th]"
done

echo "[/tr]"
echo "[/thead]"

echo "[tbody]"
for row in $(tail -n+2 $csvFile); do
    echo "[tr]"
    for cell in $(echo "$row" | tr ',' ' '); do
        echo "[td]$cell[/td]"
    done
    echo "[/tr]"
done
echo "[/tbody]"
echo "[/table]"
