#!/bin/bash

length=10
random_string=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c "$length")


# Check if the 'cd' command was successful
if [ $? -ne 0 ]; then
    echo "Error: Unable to change directory."
    exit 1
fi

# Write random string to README.md
echo "$random_string" > README.md


