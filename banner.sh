#!/data/data/com.termux/files/usr/bin/bash
[ -f "$HOME/.neon-hacker/config.sh" ] && . "$HOME/.neon-hacker/config.sh"

G='\033[1;32m'; C='\033[1;36m'; W='\033[1;97m'
P='\033[1;35m'; R='\033[0m'; D='\033[2;32m'
clear
echo -e "${G}"
cat <<'ART'
  ███╗   ██╗███████╗ ██████╗ ███╗   ██╗
  ████╗  ██║██╔════╝██╔═══██╗████╗  ██║
  ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║
  ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║
  ██║ ╚████║███████╗╚██████╔╝██║ ╚████║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
          H A C K E R   T E R M I N A L
ART
echo -e "${R}${D}  [ SYSTEM ONLINE ]  [ SECURE SHELL ]  [ READY ]${R}"
echo -e "${C}  ┌────────────────────────────────────────────┐"
printf "  │  USER   : ${W}%-34s${C}│\n" "${USER_NAME:-ANDROID USER}"
printf "  │  ROLE   : ${W}%-34s${C}│\n" "${USER_ROLE:-CREATOR}"
printf "  │  DEVICE : ${W}%-34s${C}│\n" "$(getprop ro.product.model 2>/dev/null || echo Android)"
printf "  │  ANDROID: ${W}%-34s${C}│\n" "$(getprop ro.build.version.release 2>/dev/null || echo Unknown)"
printf "  │  DATE   : ${W}%-34s${C}│\n" "$(date '+%d-%b-%Y %I:%M %p')"
echo -e "  └────────────────────────────────────────────┘${R}"
echo -e "${P}  >> ${G}IDENTITY VERIFIED${R} ${D}|${R}${G} WORKSPACE READY${R}"
echo -e "${D}  Tip: edit ~/.neon-hacker/config.sh to change your profile.${R}\n"
