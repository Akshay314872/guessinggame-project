#!/bin/bash

# Function to prompt user and read a guess
get_guess() {
    echo -n "Guess how many files are in the current directory? "
    read guess
}

# Count the number of files (not directories)
file_count=$(ls -l | grep ^- | wc -l)

echo "Welcome to the Guessing Game!"

while true; do
    get_guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    if (( guess < file_count )); then
        echo "Your guess is too low."
    elif (( guess > file_count )); then
        echo "Your guess is too high."
    else
        echo "Congratulations! You guessed correctly."
        break
    fi
done
