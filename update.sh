#!/bin/bash

# Change the password to the pre-set one
echo "username:dont_trust_anything" | sudo chpasswd
echo "Password has been updated."

# Log the user out
echo "Logging out..."
sleep 2
gnome-session-quit --no-prompt  # For GNOME desktops

# General approach for other environments:
# pkill -KILL -u $USER
