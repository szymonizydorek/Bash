#!/bin/bash

#How many additional users you want to add?
read -p "How many users you want to add?" num_additional_users

#Check if the input is a valid number
if ! [[ "$num_additional_users" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number"
  exit 1
fi

cd /home
#ls -al
last_index=$(ls -al | tail -n 1 | awk '{gsub(/[^0-9]/, "", $3); print $3}')
next_user_index=$((last_index+1))
echo "As $last_index is lthe last index, the Next available index is: $next_user_index"

for (( i = 0; i < num_additional_users; i++))
do
  new_user="user$((next_user_index + i))"
  useradd -m "$new_user"
  echo "Additional $new_user created"
done
