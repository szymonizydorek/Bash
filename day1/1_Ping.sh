echo -e "This is day 2 of Bash Challenge \n Provide website address: "
read website
ping -c 3 $website | grep loss
