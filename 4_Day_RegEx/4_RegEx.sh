#!/bin/bash

# Define a regular expression to match email addresses
email_regex="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}"

# Specify the file you want to search in
file="sample.txt"

# Use grep with the regular expression to find email addresses in the file
emails=$(grep -E -o "$email_regex" "$file")

# Display the found email addresses
echo "Email Addresses in $file:"
echo "$emails"
