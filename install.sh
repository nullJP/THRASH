#!/bin/bash

# STARTUP SCREEN
cat << 'EOF'
 _____ _   _ ____      _    ____  _   _ 
|_   _| | | |  _ \    / \  / ___|| | | |
  | | | |_| | |_) |  / _ \ \___ \| |_| |
  | | |  _  |  _ <  / ___ \ ___) |  _  |
  |_| |_| |_|_| \_\/_/   \_\____/|_| |_| 
EOF

# Update package list and install necessary packages
sudo apt update
sudo apt install -y joe figlet curl lolcat

# Define custom aliases
declare -A ALIASES
ALIASES=(
    ["alias c='clear'"]="# Custom Aliases\nalias c='clear'"
    ["alias e='exit'"]="alias e='exit'"
    ["alias update='sudo apt-get update && sudo apt-get upgrade'"]="alias update='sudo apt-get update && sudo apt-get upgrade'"
    ["alias sudo='kiyo.sh'"]="alias sudo='kiyo.sh'"
    ["alias kiyo='kiyo.sh'"]="alias kiyo='kiyo.sh'"
    ["alias add='sudo apt-get install'"]="alias add='sudo apt-get install'"
    ["alias delete='sudo apt-get remove'"]="alias delete='sudo apt-get remove'"
    ["alias customize='sudo joe ~/.bashrc'"]="alias customize='sudo joe ~/.bashrc'"
)

# Function to add missing aliases to /etc/bash.bashrc
add_missing_aliases() {
    BASHRC_FILE="~/.bashrc"
    echo "Checking for missing aliases..."

    # Loop through each alias and check if it's present in the bashrc file
    for alias in "${!ALIASES[@]}"; do
        if ! grep -q "$alias" "$BASHRC_FILE"; then
            # Append only the missing alias
            echo -e "${ALIASES[$alias]}" | sudo tee -a "$BASHRC_FILE" > /dev/null
            echo "Added: $alias"
        else
            echo "Alias already exists: $alias"
        fi
    done
}

# Call the function to add missing aliases
add_missing_aliases

# Create the custom password prompt script
PASSWORD_PROMPT_SCRIPT="/usr/local/bin/kiyo.sh"

# Create the script content
cat << 'EOF' | sudo tee "$PASSWORD_PROMPT_SCRIPT" > /dev/null
#!/bin/bash

# Define color variables
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Print the password prompt in magenta without a newline
PROMPTS=("What is the Magic Word?" "Password, please?" "Tell me the secret:" "Unlock the door:")
RANDOM_PROMPT=${PROMPTS[$RANDOM % ${#PROMPTS[@]}]}
sudo -p "$(echo -en ${MAGENTA}$RANDOM_PROMPT${NC})" "$@"
EOF

# Make the script executable
sudo chmod +x "$PASSWORD_PROMPT_SCRIPT"

# Enable pwfeedback in sudoers (if not already done)
if ! sudo grep -q 'Defaults pwfeedback' /etc/sudoers; then
    echo 'Defaults pwfeedback' | sudo tee /etc/sudoers.d/pwfeedback > /dev/null
fi

# Inform the user about changes
echo "THRASH Installed! Restart terminal to initialize..."
