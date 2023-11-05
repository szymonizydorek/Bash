LOWER="abcdefghijklmnopqrstuvwxyz"
UPPER="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SPECIAL_CHARS="!@#$%^&*()_+{}[]|:;<>,.?/~"

read -p "Provide the length of the password: " pass_wd_length
read -p "Provide the complexity of the password: [1 - 4]" pass_wd_complexity

generate_password() {
    password=""
    if [[ $pass_wd_complexity == 1 ]]; then
        for ((pass_characters = 1; pass_characters <= pass_wd_length; pass_characters++)); do
            random_char="${LOWER}${UPPER}${DIGITS}${SPECIAL_CHARS}"
            password="${password}${random_char:RANDOM % ${#random_char}:1}"
        done

        echo "Generated Password: $password"
    else
        echo "Invalid complexity level. Please choose a complexity level between 1 and 4."
    fi
}

generate_password
