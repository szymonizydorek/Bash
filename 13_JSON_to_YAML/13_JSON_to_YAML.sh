#!/bin/bash

input_json="generated.json"
output_yaml="output.yaml"

if [ -f "$input_json" ]; then
    echo "File found"
    a=$(yq -oy '.' "generated.json" > "new.yaml")    
    echo "New yaml crated. See file"
else
    echo "Error: Input file $input_json not found."
fi


