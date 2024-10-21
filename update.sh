sudo apt install expect

#!/usr/bin/expect -f

# Change the password using expect to automate passwd
set username $env(USER)
set newpass "Test1234"

spawn passwd $username
expect "New password:"
send "$newpass\r"
expect "Retype new password:"
send "$newpass\r"
expect eof

# Lock the screen
exec sleep 2
exec loginctl lock-session || exec xset s activate
