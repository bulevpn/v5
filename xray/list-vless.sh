#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

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
tls="$(cat ~/log-install.txt | grep -w "Vless WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless WS none TLS" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "${BIRed}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "${BBall}     ⇱ Check XRAY VLESS Config ⇲           ${NC}"
                echo -e "${BIRed}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "${BIRed}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

      	echo -e "${BIRed}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${BBall}    ⇱ Check XRAY VLESS Config ⇲          ${NC}"
        echo -e "${BIRed}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
        echo -e "${BIRed}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
clear

user=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&host=${domain}&type=ws&sni=$sni#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&security=none&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
clear
clear
clear
clear
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}   • XRAY VLESS •    ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Remarks      ${BIBlue}: ${WH}${user}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Domain       ${BIBlue}: ${WH}${domain}" | tee -a /etc/log-create-user.log
#echo -e "$COLOR1${NC}${WH}Wildcard     ${BIBlue}: ${WH}(bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Port GRPC    ${BIBlue}: ${WH}443" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Port TLS     ${BIBlue}: ${WH}443" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Port none TLS${BIBlue}: ${WH}80,8080" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}id           ${BIBlue}: ${WH}${uuid}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Encryption   ${BIBlue}: ${WH}none" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Network      ${BIBlue}: ${WH}ws" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Path         ${BIBlue}: ${WH}/vless" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${WH}Path         ${BIBlue}: ${WH}vless-grpc" | tee -a /etc/log-create-user.log
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}Link Websocket TLS :${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIBlue}${vlesslink1}${NC}"  | tee -a /etc/log-create-user.log
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}Link Websocket non TLS :${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIBlue}${vlesslink2}${NC}"  | tee -a /etc/log-create-user.log
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}Link gRPC :${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIBlue}${vlesslink3}${NC}"  | tee -a /etc/log-create-user.log
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} Expired On   : $exp ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}────────────${NC}" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-vless
