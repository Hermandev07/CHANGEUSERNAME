#!/bin/bash

# Change the password to the pre-set one
echo "$USER:king1234" | sudo passwd
echo "Password has been updated."

# Log the user out
echo "Logging out..."
sleep 2
loginctl lock-session || xset s activate 

# General approach for other environments:
# pkill -KILL -u $USER
