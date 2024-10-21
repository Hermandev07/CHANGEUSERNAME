#!/bin/bash

# Change the password to the pre-set one
echo "$USER:Test1234" | sudo passwd 

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
