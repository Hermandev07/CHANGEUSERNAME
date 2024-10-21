#!/bin/bash

# Change the password to the pre-set one
if echo "$USER:Dont1234" | sudo chpasswd; then
    echo "Password has been updated successfully."
else
    echo "Error: Failed to update the password."
    exit 1
fi  # <--- This 'fi' was missing

# Lock the screen
echo "Locking the screen..."
sleep 2

# Try to lock the screen using loginctl
if loginctl lock-session; then
    echo "Screen has been locked using loginctl."
else
    echo "Failed to lock the screen using loginctl. Trying xset."
    
    # Lock the screen using xset
    if xset s activate; then
        echo "Screen has been locked using xset."
    else
        echo "Failed to lock the screen using xset."
        exit 1
    fi
fi
