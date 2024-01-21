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

# Add changes to the Git staging area
git add .

# Check if 'git add' was successful
if [ $? -ne 0 ]; then
    echo "Error: Unable to add changes to the staging area."
    exit 1
fi

# Commit changes with the random string as the commit message
git commit -m "$random_string"

# Check if 'git commit' was successful
if [ $? -ne 0 ]; then
    echo "Error: Unable to commit changes."
    exit 1
fi

# Push changes to the 'main' branch
git push git@github.com:dvip1/updateReadme.git main
# Check if 'git push' was successful
if [ $? -ne 0 ]; then
    echo "Error: Unable to push changes to the 'main' branch."
    exit 1
fi

echo "Script executed successfully."

