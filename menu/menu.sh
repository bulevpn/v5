#!/bin/bash
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

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/bulevpn/v5/main/ipvps | grep $MYIP | awk '{print $3}')
fi

# =========================================
vmc=$(grep -c -E "^#vmg " "/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
vlx=$(grep -c -E "^#vlg " "/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
trx=$(grep -c -E "^#tr " "/etc/xray/config.json")
# TOTAL ACC CREATE OVPN SSH
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

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
NC='\e[0m'
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

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

# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/bagusid93/pp/main/ipvps | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
export sem=$( curl -s https://raw.githubusercontent.com/bulevpn/v5/main/versi)
IPVPS=$(curl -s ipinfo.io/ip )

# IBAM
ISP=$(curl -s ipinfo.io/org?token=ce3da57536810d | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city?token=ce3da57536810d )
WKT=$(curl -s ipinfo.io/timezone?token=ce3da57536810d )

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
export sem=$( curl -s https://raw.githubusercontent.com/bulevpn/v5/main/versi)
IPVPS=$(curl -s ipinfo.io/ip )

clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BIYellow}                     🔥 INFORMASI 🔥                        ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "♣${BIYellow} Server Uptime       👉 ${BICyan}$( uptime -p  | cut -d " " -f 2-10000 ) ${NC}"
echo -e "♣${BIYellow} Current Time        👉 ${BICyan}$( date -d "0 days" +"%d-%m-%Y | %X" )${NC}"
echo -e "♣${BIYellow} Operating System    👉 ${BICyan}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )${NC}"
echo -e "♣${BIYellow} Isp                 👉 ${BICyan}$ISP ${NC}"
echo -e "♣${BIYellow} City                👉 ${BICyan}$CITY ${NC}"
echo -e "♣${BIYellow} Ip Vps              👉 ${BICyan}$IPVPS ${NC}"
echo -e "♣${BIYellow} Current Domain      👉 ${BICyan}$( cat /etc/xray/domain )${NC}"
echo -e "♣${BIYellow} NS Domain           👉 ${BICyan}$( cat /etc/xray/dns )${NC}"
echo -e "♣${BIYellow} Jumlah Ram          👉 ${BICyan}${totalram} MB"
echo -e "♣${BIYellow} CPU Usage           👉 ${BICyan}$cpu_usage"
echo -e "♣${BIYellow} Time Reboot VPS     👉 ${BICyan}00:00 ${BICyan}(Jam 12 Malam)${NC}"
echo -e "♣${BIYellow} Whatsapp            👉 ${BICyan}083877826797${NC}"
echo -e "♣${BIYellow} AutoScript By       👉 ${BICyan}Badbud${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "     ${BICyan} SSH ${NC}: ${BIYellow}$ressh${NC}"" ${BICyan} NGINX ${NC}: ${BIYellow}$resngx${NC}"" ${BICyan}  XRAY ${NC}: ${BIYellow}$resv2r${NC}"" ${BICyan} TROJAN ${NC}: ${BIYellow}$resv2r${NC}"
echo -e "   ${BICyan}     STUNNEL ${NC}: ${BIYellow}$resst" "${BICyan} DROPBEAR ${NC}: ${BIYellow}$resdbr" "${BICyan} SSH-WS ${NC}: ${BIYellow}$ressshws"
echo -e " ${BICyan}┌──────────────────────────────────────────────────┐${NC}" 
echo -e " ${BICyan}│    \033[0m ${BOLD}${BIYellow}SSH     VMESS       VLESS      TROJAN $NC" 
echo -e " ${BICyan}│    \033[0m ${BICyan} $ssh1        $vmc           $vlx          $trx   $NC" 
echo -e " ${BICyan}└──────────────────────────────────────────────────┘${NC}" 
echo -e " ${BIYellow}                  🔥 MENU UTAMA 🔥${NC} "
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│    [${BICyan}01${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] SSH      ${NC}"  "     ${BICyan}[${BICyan}06${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] SETTING    ${NC}" "${BICyan}│${NC}"
echo -e " ${BICyan}│    [${BICyan}02${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] VMESS    ${NC}"  "     ${BICyan}[${BICyan}07${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] RUNNING    ${NC}" "${BICyan}│${NC}"
echo -e " ${BICyan}│    [${BICyan}03${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] VLESS    ${NC}"  "     ${BICyan}[${BICyan}08${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] BACKUP     ${NC}" "${BICyan}│${NC}"
echo -e " ${BICyan}│    [${BICyan}04${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] TROJAN   ${NC}"  "     ${BICyan}[${BICyan}09${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] UUID       ${NC}" "${BICyan}│${NC}"
echo -e " ${BICyan}│    [${BICyan}05${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] L2TP/PPTP${NC}"  "     ${BICyan}[${BICyan}10${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}] SET REBOOT ${NC}" "${BICyan}│${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e " ${BIYellow}                 🔥 MENU TAMBAHAN 🔥${NC} "
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}|    [${BICyan}11${BICyan}] REGISTRASI IP BARU${NC} "
echo -e " ${BICyan}|    [${BICyan}12${BICyan}] UPDATE SCRIPT${NC} "
echo -e " ${BICyan}|    [${BICyan}13${BICyan}] BACKUP TO GITHUB${NC} "
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}  $NC ${BICyan}HARI ini${NC}: ${BIYellow}$ttoday$NC ${BICyan}KEMARIN${NC}: ${BIYellow}$tyest$NC ${BICyan}BULAN${NC}: ${BIYellow}$tmon$NC $NC"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌─────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│  Version      ${NC} :${BIYellow} ${sem} ${BICyan}Last Update ${NC}"
echo -e " ${BICyan}│  User         ${NC} :${BIYellow} ${Name} ${NC}"
echo -e " ${BICyan}│  Expired      ${NC} :${BIYellow} ${Exp} ${NC}"
echo -e " ${BICyan}└─────────────────────────────────────┘${NC}"
echo ""
echo -e   " ${BICyan} Tekan x Untuk Exit Script ${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-l2tp ;;
6) clear ; menu-set ;;
7) clear ; running ;;
8) clear ; menu-backup ;;
9) clear ; menu-uuid ;;
10) clear ; jam ;;
11) clear ; m-ip ;;
12) clear ; menu-update ;;
13) clear ; menu-bckp ;;
14) clear ; menu-update ;;
15) clear ; menu-bckp ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; ctrl+c ;;
esac
