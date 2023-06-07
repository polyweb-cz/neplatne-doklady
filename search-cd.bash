#!/bin/bash

# Získání parametrů
hledany_op="$1"
cesta="$2"

# Sloučení druhého a třetího parametru s mezerou

file="source/op_vse.csv"

if [ -n "$cesta" ]; then
  file=$cesta
fi

# Vyhledávání a převod do JSON
if [ -n "$hledany_op" ]; then
  output=$(grep "$hledany_op" "$file" | awk -F ";" -v OFS='","' '{gsub(/[[:cntrl:]]/,"",$1); gsub(/[[:cntrl:]]/,"",$2); print "{\"cislo_op\":\""$1"\",\"datum_op\":\""$2"\"},"}')

  echo "[${output%?}]"  # Odstranění posledního znaku (čárky) a přidání závorky
else
  echo "Nebyl zadán žádný hledaný výraz."
fi
