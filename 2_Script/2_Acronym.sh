#!/usr/bin/env bash

read -p "Enter three words: " word1 word2 word3

# Extract the first character of each word and capitalize it
acronym="${word1:0:1}${word2:0:1}${word3:0:1}"
acronym=$(echo "$acronym" | tr '[:lower:]' '[:upper:]')

echo "Acronym: $acronym"
