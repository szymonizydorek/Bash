read -p "Provide three characters: " char1 char2 char3

x1=$(echo "$char1" | awk '{print substr($1, 1, 1)}')
x2=$(echo "$char2" | awk '{print substr($1, 1, 1)}')
x3=$(echo "$char3" | awk '{print substr($1, 1, 1)}')

echo "The acronym of words $char1 $char2 $char3 is $x1$x2$x3"