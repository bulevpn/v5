#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

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
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
#nameserver=`cat /root/nsdomain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
#nameserver1=`cat /etc/slowdns/infons`
#slkey1=`cat /root/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`


echo -e "${BIRed}┌──────────────────────────────────────┐${NC}"
echo -e "${BBall}             • SSH PANEL MENU •            ${NC}"
echo -e "${BIRed}└──────────────────────────────────────┘${NC}"
echo -e "${BIRed}┌──────────────────────────────────────┐${NC}"
read -p "Username : " Login

CLIENT_EXISTS=$(grep -w $Login /etc/xray/ssh | wc -l)

if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
echo -e "${BIRed}┌──────────────────────────────────────┐${NC}"
echo -e "${BBall}             • SSH PANEL MENU •            ${NC}"
echo -e "${BIRed}└──────────────────────────────────────┘${NC}"
echo -e "${BIRed}┌──────────────────────────────────────┐${NC}"
echo ""
echo "A client with the specified name was already created, please choose another name."
echo ""
echo -e "${BIRed}└─────────────────────────────────────────────────┘${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
sleep 1
clear
clear
clear
clear
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "### $Login $expi $Pass" >> /etc/xray/ssh
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Account   </code>
<code>──────────────────</code>
<code>Username        : </code> <code>$Login</code>
<code>Password        : </code> <code>$Pass</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Host Slowdns    : </code> <code>$sldomain</code>
<code>Pub Key          : </code> <code> $slkey</code>
<code>Port OpenSSH    : </code> <code>$opensh</code>
<code>Port Dropbear    : </code> <code>$db</code>
<code>Port DNS         : </code> <code>80, 443,53</code>
<code>Port SSH UDP     : </code> <code>1-65535</code>
<code>Port SSH WS     : </code> <code>80, 8080</code>
<code>Port SSH SSL WS : </code> <code>$wsssl</code>
<code>Port SSL/TLS     : </code> <code>445,777</code>
<code>Port OVPN WS SSL : </code> <code>2086</code>
<code>Port OVPN SSL    : </code> <code>990</code>
<code>Port OVPN TCP    : </code> <code>$ovpn</code>
<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
<code>Proxy Squid        : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP :</code> <code>$domen:1-65535@$Login:$Pass</code>
<code>Payload WS   : </code> <code>GET ws://$domen/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────</code>
<code>All OpenVPN      : </code> https://$domen:81
<code>───────────────────</code>
<code>           Papada'an Store                       </code>
<code>───────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

if [[ ! -z "${PID}" ]]; then

clear
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$BICyan $NC  ${BICyan}SSH OVPN Account$NC" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Username   ${BICyan}: ${BIGreen}$Login"  | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Password   ${BICyan}: ${BIGreen}$Pass" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Expired On ${BICyan}: ${BIGreen}$exp"  | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}IP         ${BICyan}: ${BIGreen}$IP" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Host       ${BICyan}: ${BIGreen}$domen" | tee -a /etc/log-create-user.log
#echo -e "${BICyan} $NC${BICyan}Wildcard   ${BICyan}: ${BIGreen}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port OpenSSH    ${BICyan}: ${BIGreen}$opensh" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port Dropbear   ${BICyan}: ${BIGreen}$db" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSH-UDP    ${BICyan}: ${BIGreen}1-65535" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSH-WS     ${BICyan}: ${BIGreen}80,8080" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSH-SSL-WS ${BICyan}: ${BIGreen}$wsssl" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSL/TLS    ${BICyan}: ${BIGreen}445,777" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port TCP   ${BICyan}: ${BIGreen}$ovpn" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port UDP   ${BICyan}: ${BIGreen}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSL   ${BICyan}: ${BIGreen}990" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}OpenVpn   ${BICyan}: ${BIGreen}http://$domen:81" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}UDPGW      ${BICyan}: ${BIGreen}7100-7300" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port Slowdns ${BICyan}: ${BIGreen}80,443,53" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Name Server ${BICyan}: ${BIGreen}$sldomain" | tee -a /etc/log-create-user.log
#echo -e "${BICyan} $NC${BICyan}Name Server ${BICyan}: ${BIGreen}$nameserver"
echo -e "${BICyan} $NC${BICyan}Public Key  ${BICyan}: ${BIGreen}$slkey" | tee -a /etc/log-create-user.log
#echo -e "${BICyan} $NC${BICyan}Name Server ${BICyan}: ${BIGreen}$nameserver1"
#echo -e "${BICyan} $NC${BICyan}Public Key  ${BICyan}: ${BIGreen}$slkey1"
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${BICyan}SSH UDP HC :                 ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIGreen}${NC}${BIGreen}$domen:1-65535@$Login:$Pass${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${BICyan}Payload WSS :                                      ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIGreen}${NC}${BIGreen}GET /cdn-cgi/trace HTTP/1.1[crlf]Host: isi_bug_disini[crlf][crlf]CF-RAY / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${BICyan}Payload WS :                  ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIGreen}${NC}${BIGreen}GET ws://$domen/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
else

echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$BICyan $NC  ${BICyan}SSH OVPN Account$NC" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Username   ${BICyan}: ${BIGreen}$Login"  | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Password   ${BICyan}: ${BIGreen}$Pass" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Expired On ${BICyan}: ${BIGreen}$exp"  | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}IP         ${BICyan}: ${BIGreen}$IP" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Host       ${BICyan}: ${BIGreen}$domen" | tee -a /etc/log-create-user.log
#echo -e "${BICyan} $NC${BICyan}Wildcard   ${BICyan}: ${BIGreen}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port OpenSSH    ${BICyan}: ${BIGreen}$opensh" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port Dropbear   ${BICyan}: ${BIGreen}$db" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSH-UDP    ${BICyan}: ${BIGreen}1-65535" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSH-WS     ${BICyan}: ${BIGreen}80,8080" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSH-SSL-WS ${BICyan}: ${BIGreen}$wsssl" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSL/TLS    ${BICyan}: ${BIGreen}445,777" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port TCP   ${BICyan}: ${BIGreen}$ovpn" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port UDP   ${BICyan}: ${BIGreen}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port SSL   ${BICyan}: ${BIGreen}990" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}OpenVpn   ${BICyan}: ${BIGreen}http://$domen:81" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}UDPGW      ${BICyan}: ${BIGreen}7100-7300" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Port Slowdns ${BICyan}: ${BIGreen}80,443,53" | tee -a /etc/log-create-user.log
echo -e "${BICyan} $NC${BICyan}Name Server ${BICyan}: ${BIGreen}$sldomain" | tee -a /etc/log-create-user.log
#echo -e "${BICyan} $NC${BICyan}Name Server ${BICyan}: ${BIGreen}$nameserver"
echo -e "${BICyan} $NC${BICyan}Public Key  ${BICyan}: ${BIGreen}$slkey" | tee -a /etc/log-create-user.log
#echo -e "${BICyan} $NC${BICyan}Name Server ${BICyan}: ${BIGreen}$nameserver1"
#echo -e "${BICyan} $NC${BICyan}Public Key  ${BICyan}: ${BIGreen}$slkey1"
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${BICyan}SSH UDP HC :                 ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIGreen}${NC}${BIGreen}$domen:1-65535@$Login:$Pass${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${BICyan}Payload WSS :                                      ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIGreen}${NC}${BIGreen}GET /cdn-cgi/trace HTTP/1.1[crlf]Host: isi_bug_disini[crlf][crlf]CF-RAY / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "${BICyan}${NC}${BICyan}Payload WS :                  ${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIGreen}${NC}${BIGreen}GET ws://$domen/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "${BIRed}─────────────────────${NC}" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
