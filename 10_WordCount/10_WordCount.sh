#!/bin/bash

filename=$1

word_count=$(cat "$filename" | wc -w)
echo "Word count in $filename is $word_count"

