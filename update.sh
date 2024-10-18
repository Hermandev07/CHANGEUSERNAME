#!/bin/bash

# Change the password to the pre-set one
echo "$USER:TEST" | sudo chpasswd
echo "Password has been updated."

# Log the user out
echo "Logging out..."
sleep 2

# Forcefully log out the user
pkill -KILL -u "$USER"
