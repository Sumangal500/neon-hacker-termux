#!/data/data/com.termux/files/usr/bin/bash

# Colors
G='\033[1;32m'
C='\033[1;36m'
Y='\033[1;33m'
R='\033[1;31m'
W='\033[1;37m'
N='\033[0m'

clear
echo -e "${G}"
cat << "EOF"
███╗   ██╗███████╗ ██████╗ ███╗   ██╗
████╗  ██║██╔════╝██╔═══██╗████╗  ██║
██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║
██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║
██║ ╚████║███████╗╚██████╔╝██║ ╚████║
╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
EOF
echo -e "\( {C}          H A C K E R   T E R M I N A L \){N}"
echo -e "\( {Y}════════════════════════════════════════════ \){N}\n"

# Install dependencies
echo -e "\( {G}[+] Installing required packages... \){N}"
pkg update -y > /dev/null 2>&1
pkg install -y figlet toilet neofetch curl > /dev/null 2>&1

# Ask for Name & Username
echo -e "${C}"
read -p "Enter Your Name      : " USER_NAME
read -p "Enter Your Username  : " USER_HANDLE
echo -e "${N}"

# Create config directory
mkdir -p $HOME/.neon-hacker

# Save user info
cat > $HOME/.neon-hacker/config.sh << EOF
USER_NAME="$USER_NAME"
USER_HANDLE="$USER_HANDLE"
EOF

# Create the main banner script
cat > $HOME/.neon-hacker/banner.sh << 'BANNER_EOF'
#!/data/data/com.termux/files/usr/bin/bash

# Load config
source $HOME/.neon-hacker/config.sh

# Colors
G='\033[1;32m'
C='\033[1;36m'
Y='\033[1;33m'
R='\033[1;31m'
W='\033[1;37m'
B='\033[1;34m'
N='\033[0m'

# Get system info
DEVICE=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
ANDROID=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
DATE=$(date +"%d-%b-%Y %I:%M %p")
IP=$(curl -s --connect-timeout 2 ifconfig.me 2>/dev/null || echo "Offline")

clear
echo -e "${G}"
figlet -f slant "NEON" 2>/dev/null || echo "NEON"
echo -e "${C}╔══════════════════════════════════════════╗"
echo -e "║\( {Y}          H A C K E R   T E R M I N A L \){C}         ║"
echo -e "╚══════════════════════════════════════════╝${N}"
echo -e "\( {G}[ SYSTEM ONLINE ] [ SECURE SHELL ] [ READY ] \){N}\n"

echo -e "${C}┌──────────────────────────────────────────┐"
echo -e "│ ${W}USER     ${G}: ${Y}$USER_NAME"
echo -e "│ ${W}HANDLE   ${G}: ${Y}@$USER_HANDLE"
echo -e "│ ${W}ROLE     ${G}: ${R}ROOT ACCESS"
echo -e "│ ${W}DEVICE   ${G}: ${Y}$DEVICE"
echo -e "│ ${W}ANDROID  ${G}: ${Y}$ANDROID"
echo -e "│ ${W}DATE     ${G}: ${Y}$DATE"
echo -e "│ ${W}IP       ${G}: ${Y}$IP"
echo -e "\( {C}└──────────────────────────────────────────┘ \){N}"

echo -e "\n\( {G}>> IDENTITY VERIFIED | WORKSPACE READY \){N}"
echo -e "\( {Y}Tip: edit \~/.neon-hacker/config.sh to change profile. \){N}\n"
BANNER_EOF

chmod +x $HOME/.neon-hacker/banner.sh

# Add to bashrc
if ! grep -q "neon-hacker/banner.sh" $HOME/.bashrc 2>/dev/null; then
    echo "" >> $HOME/.bashrc
    echo "# Neon Hacker Banner" >> $HOME/.bashrc
    echo "bash $HOME/.neon-hacker/banner.sh" >> $HOME/.bashrc
fi

# Also for zsh if exists
if [ -f $HOME/.zshrc ]; then
    if ! grep -q "neon-hacker/banner.sh" $HOME/.zshrc 2>/dev/null; then
        echo "" >> $HOME/.zshrc
        echo "# Neon Hacker Banner" >> $HOME/.zshrc
        echo "bash $HOME/.neon-hacker/banner.sh" >> $HOME/.zshrc
    fi
fi

echo -e "\n\( {G}════════════════════════════════════════════ \){N}"
echo -e "\( {G}[✓] Installation Complete! \){N}"
echo -e "\( {C}Close Termux completely and open again to see your banner. \){N}"
echo -e "${Y}Your Name     : \( USER_NAME \){N}"
echo -e "${Y}Your Handle   : @\( USER_HANDLE \){N}"
echo -e "\( {G}════════════════════════════════════════════ \){N}\n"
