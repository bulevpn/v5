#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

# Color Cancut
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

clear
echo -e "${BIYellow}┌─────────────────────────────────────────────────┐${NC}"
echo -e "$BIPurple ${NC} ${BIPurple}                 ${WH}• MEMBER SSH •                 ${NC}$BIPurple$NC"
echo -e "${BIYellow}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BIYellow}┌─────────────────────────────────────────────────┐${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "${BIYellow}└─────────────────────────────────────────────────┘${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "${BIYellow}┌─────────────────────────────────────────────────┐${NC}"
echo "               Total Account: $JUMLAH user"
echo -e "${BIYellow}└─────────────────────────────────────────────────┘${NC}"
echo -e "${yell}┌─────────────────────────────────────────────────┐${NC}"
echo -e "$BIPurple${NC}${BIPurple}              ${WH}• DELETE USERS •             ${NC}$BIPurple$NC"
echo -e "${BIYellow}└─────────────────────────────────────────────────┘${NC}"
echo ""
read -p "Username SSH to Delete 👉 " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
sed -i "/^### $Pengguna/d" /etc/xray/ssh
read -n 1 -s -r -p "Press any key to back on menu"

menu
