#!/bin/bash

# Change the password to the pre-set one
echo "$USER:TEST" | sudo chpasswd
if [ $? -eq 0 ]; then
    echo "Password has been updated."
else
    echo "Failed to update password."
    exit 1
fi

# Lock the screen
echo "Locking the screen..."
sleep 2

# Lock the screen using a common command
# Using `loginctl lock-session` is a good option for systems with systemd
if loginctl lock-session; then
    echo "Screen has been locked."
else
    echo "Failed to lock the screen."
    exit 1
fi
