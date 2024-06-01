#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bulevpn/v5/main/ipvps > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bulevpn/v5/main/ipvps | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bulevpn/v5/main/ipvps | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi

# // Exporting Language to UTF-8
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
BBall='\E[44;1;39m'       #Ibam
TC='\E[0m'
NC='\e[0m'

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"


clear
clear
echo -e "\033[1;91m┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BBall}              ${BIPurple}• TROJAN PANEL MENU •                ${TC}"
echo -e "\033[1;91m└─────────────────────────────────────────────────┘${NC}"
echo -e "\033[1;91m┌─────────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC${WH}[${BICyan}01${NC}]${NC} ${COLOR1}• ${BIYellow}ADD TROJAN${NC}       ${WH}[${BICyan}05${NC}]${NC} ${COLOR1}• ${BIYellow}USER ONLINE${NC}   $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC${WH}[${BICyan}02${NC}]${NC} ${COLOR1}• ${BIYellow}TRIAL TROJAN${NC}     ${WH}[${BICyan}06${NC}]${NC} ${COLOR1}• ${BIYellow}CEK CONFIG${NC}    $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC${WH}[${BICyan}03${NC}]${NC} ${COLOR1}• ${BIYellow}RENEW TROJAN${NC}     ${WH}[${BICyan}07${NC}]${NC} ${COLOR1}• ${BIYellow}TROJAN MANUAL UUID${NC}    $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC${WH}[${BICyan}04${NC}]${NC} ${COLOR1}• ${BIYellow}DELETE AKUN${NC}    $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC${WH}[${BICyan}00${NC}]${NC} ${COLOR1}• ${BIYellow}BACK TO MENU${NC}     $COLOR1 $NC"
echo -e "\033[1;91m└─────────────────────────────────────────────────┘${NC}"
echo -e "\033[1;91m┌──────────────────────${NC} ${BICyan}BY${NC} \033[1;91m───────────────────────┐${NC}"
echo -e "${BBall}               ${BIPurple}•  •                ${TC}"
echo -e "\033[1;91m└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; add-tr ;;
02 | 2) clear ; trial-tr ;;
03 | 3) clear ; renew-tr ;;
04 | 4) clear ; del-tr ;;
05 | 5) clear ; cek-tr ;;
06 | 6) clear ; list-tr ;;
07 | 7) clear ; add-tru ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) echo "SALAH TEKAN" ; sleep 1 ; menu-trojan ;;
esac
