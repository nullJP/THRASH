# THRASH

THRASH essentially acts as an add-on to the bash terminal by providing fun and/or convenient command aliases and modifications to the terminal itself.

# Install
-- Change to the cloned directory
`cd THRASH`
-- Then make sure that you have execute privileges to run the ruby wizard
`sudo chmod +x install.rb`
-- Now run the wizard
`ruby install.rb`


# Added Aliases
c = clear
e = exit
update = sudo apt-get update && sudo apt-get upgrade
add = sudo apt-get install
delete = sudo apt-get remove
customize = cd /etc && sudo nano bash.bashrc


# Kiyo
This is a wrapper that changes the default prompt when a root privileges are required. When you type 'sudo' it will direct to this wrapper as well.


