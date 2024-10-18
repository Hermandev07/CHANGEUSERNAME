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

# Log out using loginctl
if loginctl terminate-user "$USER"; then
    echo "Successfully logged out $USER using loginctl."
else
    echo "Failed to log out $USER using loginctl."
    exit 1
fi
