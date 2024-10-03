# THRASH

This acts as an add-on to the bash terminal by providing fun and/or convenient command aliases and modifications to the terminal itself.

Added Aliases:
c = Clear
e = exit
update = sudo apt-get update && sudo apt-get upgrade
add = sudo apt-get install
delete = sudo apt-get remove
customize = cd /etc && sudo nano bash.bashrc


Added "Kiyo": This is a wrapper that changes the default prompt when a root privileges are required. When you type 'sudo' it will direct to this wrapper as well.
