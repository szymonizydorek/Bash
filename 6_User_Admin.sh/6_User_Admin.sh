read -p "How many users you want to remove? " num_users
x1=$(cat /etc/passwd | wc -l)

if ! [[ $num_users =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number."
  exit 1
else 
  echo "You provided: $num_users user(s) to remove."
fi

for ((i=1; i<=$num_users; i++)); do
  read -p "Provide the user you want to remove: " username
  sudo userdel -r "$username"
  echo "User $username has been deleted."
done

x2=$(cat /etc/passwd | wc -l)
echo "Before the deletion we had: $x2 users."

