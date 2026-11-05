#!/data/data/com.termux/files/usr/bin/bash
set -e

GREEN='\033[1;32m'; CYAN='\033[1;36m'; RESET='\033[0m'
echo -e "${GREEN}"
echo "╔══════════════════════════════════════════════╗"
echo "║          NEON HACKER BANNER INSTALLER        ║"
echo "╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

command -v curl >/dev/null 2>&1 || {
  echo "Installing curl..."
  pkg update -y
  pkg install curl -y
}

DEST="$HOME/.neon-hacker"
mkdir -p "$DEST"

cp banner.sh "$DEST/banner.sh"
cp config.sh "$DEST/config.sh"
chmod +x "$DEST/banner.sh"

echo
read -r -p "Enter your name: " USER_NAME
[ -n "$USER_NAME" ] || USER_NAME="ANDROID USER"
read -r -p "What do you do? (Example: I am File Maker): " USER_ROLE
[ -n "$USER_ROLE" ] || USER_ROLE="I am a Creator"

# Safely write values for Bash config
printf 'USER_NAME=%q\nUSER_ROLE=%q\n' "$USER_NAME" "$USER_ROLE" > "$DEST/config.sh"

PROFILE="$HOME/.bashrc"
touch "$PROFILE"
grep -Fq 'bash "$HOME/.neon-hacker/banner.sh"' "$PROFILE" || \
  printf '\n# NEON HACKER BANNER\nbash "$HOME/.neon-hacker/banner.sh"\n' >> "$PROFILE"

echo -e "\n${CYAN}Setup complete! Restart Termux or run: source ~/.bashrc${RESET}"
