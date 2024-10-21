#!/bin/bash

# Change the password to the pre-set one using passwd
echo -e "Test1234\nTest1234" | passwd $USER

# Lock the screen
sleep 2
loginctl lock-session || xset s activate
