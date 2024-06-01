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
yellow='\033[0;33m'
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
clear
echo ""
version=$(cat /home/ver)
ver=$( curl sS https://raw.githubusercontent.com/bulevpn/v5/main/versi )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(LATEST VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl sS https://raw.githubusercontent.com/bulevpn/v5/main/versi | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
echo -e ""
sleep 1
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
echo ""
rm -rf update
rm -rf menu-update
rm -rf menu
rm -rf m-bot
rm -rf m-ip
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-ssws
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf menu-ssh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf port-change
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf add-vless
rm -rf trialvmess
rm -rf renew-vmess
rm -rf del-vmess
rm -rf cek-vmess
rm -rf list-vmess
rm -rf add-ssws
rm -rf trial-vless
rm -rf renew-vless
rm -rf del-vless
rm -rf cek-vless
rm -rf list-vless
rm -rf add-tr
rm -rf trial-tr
rm -rf del-tr
rm -rf renew-tr
rm -rf cek-tr
rm -rf addtrgo
rm -rf trialtrojango
rm -rf deltrgo
rm -rf renewtrgo
rm -rf list-tr
rm -rf m-sshovpn
rm -rf cf
rm -rf add-vmess
rm -rf menu-bckp
rm -rf add-vls
rm -rf add-xray
rm -rf add-tru
rm -rf cek-ssws
rm -rf del-ssws
rm -rf renew-ssws

cd /usr/bin
wget -O menu-update "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-update.sh"
wget -O update "https://raw.githubusercontent.com/bulevpn/v5/main/menu/update.sh"
wget -O menu "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu.sh"
wget -O m-bot "https://raw.githubusercontent.com/bulevpn/v5/main/menu/m-bot.sh"
wget -O m-ip "https://raw.githubusercontent.com/bulevpn/v5/main/menu/m-ip.sh"
wget -O trial "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-vless.sh"
wget -O menu-ssws "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-ssws.sh"
wget -O cek-ssws "https://raw.githubusercontent.com/bulevpn/v5/main/xray/cek-ssws.sh"
wget -O running "https://raw.githubusercontent.com/bulevpn/v5/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/bulevpn/v5/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-trojan.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/usernew.sh"
wget -O member "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/member.sh"
wget -O hapus "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/hapus.sh"
wget -O menu-set "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/bulevpn/v5/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/bulevpn/v5/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/bulevpn/v5/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/bulevpn/v5/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/bulevpn/v5/main/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/bulevpn/v5/main/menu/bw.sh"
wget -O port-ssl "https://raw.githubusercontent.com/bulevpn/v5/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/bulevpn/v5/main/port/port-ovpn.sh"
wget -O xp "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/xp.sh"
wget -O acs-set "https://raw.githubusercontent.com/bulevpn/v5/main/acs-set.sh"
wget -O sshws "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/bulevpn/v5/main/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/bulevpn/v5/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/bulevpn/v5/main/backup/restore.sh"
wget -O jam "https://raw.githubusercontent.com/bulevpn/v5/main/jam.sh"
wget -O trialvmess "https://raw.githubusercontent.com/bulevpn/v5/main/xray/trialvmess.sh"
wget -O trial-vless "https://raw.githubusercontent.com/bulevpn/v5/main/xray/trial-vless.sh"
wget -O trial-tr "https://raw.githubusercontent.com/bulevpn/v5/main/xray/trial-tr.sh"
wget -O add-tr "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-tr.sh"
wget -O add-tru "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-tru.sh"
wget -O deltrgo "https://raw.githubusercontent.com/bulevpn/v5/main/xray/deltrgo.sh"
wget -O renewtrgo "https://raw.githubusercontent.com/bulevpn/v5/main/xray/renewtrgo.sh"
wget -O list-tr "https://raw.githubusercontent.com/bulevpn/v5/main/xray/list-tr.sh"
wget -O cf "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/cf.sh"
wget -O cek "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/cek.sh"
wget -O menu-bckp "https://raw.githubusercontent.com/bulevpn/v5/main/menu/menu-bckp.sh"
wget -O add-ssws "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-ssws.sh"
wget -O add-vless "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-vless.sh"
wget -O add-vls "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-vls.sh"
wget -O add-xray "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-xray.sh"
wget -O renew "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/autokill.sh"
wget -O add-vmess "https://raw.githubusercontent.com/bulevpn/v5/main/xray/add-vmess.sh"
wget -O cek-vmess "https://raw.githubusercontent.com/bulevpn/v5/main/xray/cek-vmess.sh"
wget -O del-vmess "https://raw.githubusercontent.com/bulevpn/v5/main/xray/del-vmess.sh"
wget -O list-vmess "https://raw.githubusercontent.com/bulevpn/v5/main/xray/list-vmess.sh"
wget -O renew-vmess "https://raw.githubusercontent.com/bulevpn/v5/main/xray/renew-vmess.sh"
wget -O renew-vless "https://raw.githubusercontent.com/bulevpn/v5/main/xray/renew-vless.sh"
wget -O del-vless "https://raw.githubusercontent.com/bulevpn/v5/main/xray/del-vless.sh"
wget -O cek-vless "https://raw.githubusercontent.com/bulevpn/v5/main/xray/cek-vless.sh"
wget -O list-vless "https://raw.githubusercontent.com/bulevpn/v5/main/xray/list-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/bulevpn/v5/main/xray/list-vless.sh"
wget -O renew "https://raw.githubusercontent.com/bulevpn/v5/main/ssh/renew.sh"
wget -O del-tr "https://raw.githubusercontent.com/bulevpn/v5/main/xray/del-tr.sh"
wget -O cek-tr "https://raw.githubusercontent.com/bulevpn/v5/main/xray/cek-tr.sh"
wget -O del-ssws "https://raw.githubusercontent.com/bulevpn/v5/main/xray/del-ssws.sh"
wget -O renew-ssws "https://raw.githubusercontent.com/bulevpn/v5/main/xray/renew-ssws.sh"
wget -O backup "https://raw.githubusercontent.com/bulevpn/backup/main/backup.sh"
wget -O restore "https://raw.githubusercontent.com/bulevpn/backup/main/restore.sh"

chmod +x menu-update
chmod +x update
chmod +x m-ip
chmod +x menu
chmod +x m-bot
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x menu-ssws
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x menu-ssh
chmod +x usernew
chmod +x member
chmod +x hapus
chmod +x trial
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x port-ssl
chmod +x port-ovpn
chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x jam
chmod +x trialvmess
chmod +x trial-vless
chmod +x trial-tr
chmod +x add-tr
chmod +x trialtrojango
chmod +x deltrgo
chmod +x renewtrgo
chmod +x list-tr
chmod +x cf
chmod +x cek
chmod +x menu-bckp
chmod +x add-ssws
chmod +x add-vless
chmod +x add-vls
chmod +x add-xray
chmod +x autokill
chmod +x add-vmess
chmod +x cek-vmess
chmod +x del-vmess
chmod +x list-vmess
chmod +x renew-vmess
chmod +x renew-vless
chmod +x del-vless
chmod +x cek-vless
chmod +x list-vless
chmod +x add-tru
chmod +x renew-tr
chmod +x del-tr
chmod +x cek-tr
chmod +x renew
chmod +x cek-ssws
chmod +x del-ssws
chmod +x renew-ssws

clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl sS https://raw.githubusercontent.com/bagusid93/pp/main/versi )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /home/ver
rm -f update.sh
clear
echo ""
echo -e "\033[0;34m----------------------------------------\033[0m"
echo -e "\E[44;1;39m            SCRIPT UPDATED              \E[0m"
echo -e "\033[0;34m----------------------------------------\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
x)
clear
update
;;
y)
clear
menu
;;
*)
clear
echo -e "\e[1;31mPlease Enter Option 1-2 or x & y Only..,Try again, Thank You..\e[0m"
sleep 2
menu-update
;;
esac
