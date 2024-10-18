#!/bin/bash

# Change the password to the pre-set one
echo "$USER:donttrustanything" | sudo chpasswd
echo "Password has been updated."

# Log the user out
echo "Logging out..."
sleep 2
gnome-session-quit --no-prompt  # For GNOME desktops
# For KDE:
qdbus org.kde.ksmserver /KSMServer logout 0 0 0

# For XFCE:
xfce4-session-logout --logout

# Generic command (may work depending on the system):
gnome-session-quit --logout --no-prompt


# General approach for other environments:
# pkill -KILL -u $USER
