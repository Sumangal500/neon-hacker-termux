#!/data/data/com.termux/files/usr/bin/bash
set -e

GREEN='\033[1;32m'
CYAN='\033[1;36m'
RESET='\033[0m'

clear

echo -e "${GREEN}"
echo "╔══════════════════════════════════════════════╗"
echo "║           NEON HACKER BANNER INSTALLER       ║"
echo "╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

# GitHub repository
BASE="https://raw.githubusercontent.com/Sumangal500/neon-hacker-termux/main"

# Installation directory
DEST="$HOME/.neon-hacker"

mkdir -p "$DEST"

# Install curl if missing
if ! command -v curl >/dev/null 2>&1; then
    echo -e "${CYAN}[+] Installing curl...${RESET}"
    pkg update -y
    pkg install curl -y
fi

# Download banner files
echo -e "${CYAN}[+] Downloading banner files...${RESET}"

curl -fL "$BASE/banner.sh" -o "$DEST/banner.sh"
curl -fL "$BASE/config.sh" -o "$DEST/config.sh"

chmod +x "$DEST/banner.sh"

# User information
echo
echo -e "${GREEN}Enter your details:${RESET}"

read -r -p "Enter your name: " USER_NAME
[ -n "$USER_NAME" ] || USER_NAME="ANDROID USER"

read -r -p "What do you do? " USER_ROLE
[ -n "$USER_ROLE" ] || USER_ROLE="I am a Creator"

# Save configuration
printf 'USER_NAME=%q\nUSER_ROLE=%q\n' \
    "$USER_NAME" "$USER_ROLE" > "$DEST/config.sh"

# Configure Termux startup
PROFILE="$HOME/.bashrc"
touch "$PROFILE"

STARTUP='bash "$HOME/.neon-hacker/banner.sh"'

if ! grep -Fq "$STARTUP" "$PROFILE"; then
    echo "$STARTUP" >> "$PROFILE"
fi

echo
echo -e "${GREEN}"
echo "╔══════════════════════════════════════════════╗"
echo "║             INSTALLATION SUCCESS!             ║"
echo "╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

echo "Name: $USER_NAME"
echo "Role: $USER_ROLE"
echo
echo "Restart Termux to see your banner."
echo "Or run: source ~/.bashrc"
