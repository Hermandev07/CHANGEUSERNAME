#!/bin/bash

# Change the password to the pre-set one
echo "$USER:TEST" | sudo chpasswd
if [ $? -eq 0 ]; then
    echo "Password has been updated."
else
    echo "Failed to update password."
    exit 1
fi

# Log the user out
echo "Logging out..."
sleep 2

# Forcefully log out the user
if pkill -KILL -u "$USER"; then
    echo "Successfully logged out $USER."
else
    echo "Failed to log out $USER."
    exit 1
fi
