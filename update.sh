#!/bin/bash

# Change the password to the pre-set one
echo "$USER:TEST" | sudo chpasswd
if [ $? -eq 0 ]; then
    echo "Password has been updated."
else
    echo "Failed to update password."
    exit 1
fi

# Lock the screen based on the desktop environment
echo "Locking the screen..."
sleep 2

# Check the current desktop environment
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    echo "Detected GNOME. Locking screen using gnome-screensaver-command."
    gnome-screensaver-command -l
elif [[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]]; then
    echo "Detected XFCE. Locking screen using xfce4-screensaver-command."
    xfce4-screensaver-command -l
else
    echo "Unknown or unsupported desktop environment. Locking using xset."
    xset s activate
fi
