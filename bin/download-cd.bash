#!/bin/bash

rm source/cd_vse.csv
# Přímý odkaz na soubor ke stažení
download_url="https://aplikace.mvcr.cz/neplatne-doklady/ViewFile.aspx?typ_dokladu=2"

# Název souboru, do kterého se uloží stažený soubor
zip_file="file.zip"

# Vstupní parametr pro cílovou složku
output_directory="$1"


# Výchozí složka pro případ, kdy není zadán žádný parametr
default_directory="source"

# Pokud nebyl zadán žádný parametr, použijeme výchozí složku
if [ -z "$output_directory" ]; then
  output_directory="$default_directory"
fi

# Použití příkazu curl pro stažení souboru
curl -o "$zip_file" "$download_url"

# Rozbalení zip souboru do cílové složky
unzip "$zip_file" -d "$output_directory"

rm file.zip