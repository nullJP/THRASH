# THRASH

THRASH essentially acts as an add-on to the bash terminal by providing fun and/or convenient command aliases and modifications to the terminal itself.

# Install
Installation is simple. After cloning the repository, be sure you have privilege to run the install.sh file.
You can do this with: chmod +x install.sh
After that type ./install.sh and the installation process should start right up!

# Added Aliases
c = clear
e = exit
update = sudo apt-get update && sudo apt-get upgrade
add = sudo apt-get install
delete = sudo apt-get remove
customize = cd /etc && sudo nano bash.bashrc


# Kiyo
This is a wrapper that changes the default prompt when a root privileges are required. When you type 'sudo' it will direct to this wrapper as well.


