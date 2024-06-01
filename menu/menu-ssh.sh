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
if [[ -e /etc/xray/ssh ]]; then
echo -ne
else
touch /etc/xray/ssh
fi

echo -e "$red┌─────────────────────────────────────────────────┐${NC}"
echo -e  "\E[44;1;39m                • SSH PANEL MENU •                 \E[0m"
echo -e "$red└─────────────────────────────────────────────────┘${NC}"
echo -e " $red┌───────────────────────────────────────────────┐${NC}
 $COLOR1 $NC${WH}[\e[36m01\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mADD SSH\e[0m          ${WH}[\e[36m05\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mMEMBER SSH\e[0m     $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC${WH}[\e[36m02\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mTRIAL SSH\e[0m        ${WH}[\e[36m06\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mCEK LOGIN SSH\e[0m
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC${WH}[\e[36m03\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mRENEW SSH\e[0m        ${WH}[\e[36m07\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mSET AUTOKILL SSH\e[0m    $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC${WH}[\e[36m04\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mDELETE SSH\e[0m       ${WH}[\e[36m08\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mCEK AKUN MULTI LOGIN\e[0m $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC${WH}[\e[36m00\e[0m]${NC} ${COLOR1}• ${WH}\033[1;93mGO BACK\e[0m                              $COLOR1 $NC"
echo -e " $red└───────────────────────────────────────────────┘${NC}"
echo -e "$red┌────────────────────── \033[1;96mBY\e[0m $red───────────────────────┐${NC}"
echo -e  "\E[44;1;39m                •  •               \E[0m"
echo -e "$red└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; usernew ; exit ;;
02 | 2) clear ; trial ; exit ;;
03 | 3) clear ; renew ; exit ;;
04 | 4) clear ; hapus ; exit ;;
05 | 5) clear ; member ; exit ;;
06 | 6) clear ; cek ; exit ;;
07 | 7) clear ; autokill ; exit ;;
08 | 8) clear ; ceklim ; exit ;;
00 | 0) clear ; menu ; exit ;;
X  | 0) clear ; m-sshovpn ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; m-sshovpn ;;
esac
