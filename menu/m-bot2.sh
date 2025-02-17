#!/bin/bash

grenbo="\e[92;1m"
NC='\e[0m'
WH='\033[1;37m'
BGCOLOR='\e[1;97;101m'   
BIBlue='\033[1;94m'

MYIP=$(cat /root/.myip)
ISP=$(cat /root/.isp)
CITY=$(cat /root/.city)
DOMAIN=$(cat /etc/xray/domain)

if systemctl is-active --quiet cybervpn.service; then
    status_bot="\033[32;1mONLINE\033[0m"  # Hijau jika aktif
else
    status_bot="\033[31;1mOFLINE\033[0m"  # Merah jika mati
fi

data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
url_izin="https://raw.githubusercontent.com/GeKaStore/permission/main/ip"
checking_sc() {
  useexp=$(curl -s $url_izin | grep $MYIP | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    clear
    echo -e "\033[96m============================================\033[0m"
    echo -e "\033[44;37m           NotAllowed Autoscript         \033[0m"    
    echo -e "\033[96m============================================\033[0m"
    echo -e "\e[95;1m buy / sewa AutoScript installer VPS \e[0m"
    echo -e "\033[96m============================================\033[0m"    
    echo -e "\e[96;1m   1 IP        : Rp.10.000   \e[0m"
    echo -e "\e[96;1m   2 IP        : Rp.15.000   \e[0m"   
    echo -e "\e[96;1m   7 IP        : Rp.40.000   \e[0m"
    echo -e "\e[96;1m   Unli IP     : Rp.150.000  \e[0m"
    echo -e "\e[97;1m   open source : Rp.400.000  \e[0m"       
    echo -e ""
    echo -e "\033[34m Contack WA/TLP: 087760204418     \033[0m"
    echo -e "\033[34m Telegram user : t.me/WuzzSTORE \033[0m"    
    echo -e "\033[96m============================================\033[0m"
    exit 0
  fi
}
checking_sc

function lane_atas() {
echo -e "${BIBlue}┌──────────────────────────────────────────┐${NC}"
}
function lane_bawah() {
echo -e "${BIBlue}└──────────────────────────────────────────┘${NC}"
}

lane_atas
echo -e "${BIBlue}│ ${BGCOLOR}              BOT TELEGRAM              ${NC}${BIBlue} │${NC}"
lane_bawah
echo -e "│ ${BGCOLOR}             STATUS: $status_bot             ${NC} │${NC}"
lane_bawah
lane_atas
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mInstall Bot                     ${NC}"
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mHapus Bot                       ${NC}"
echo -e "${BIBlue}│  [ 3 ]  \033[1;37mOff kan Bot                     ${NC}"
echo -e "${BIBlue}│  [ 4 ]  \033[1;37mBack to Menu                    ${NC}"
lane bawah
read -p " Just Input 1-4 : " SELECT_INPUT
case $SELECT_INPUT in
1) clear ; instalasi ;;
2) clear ;;
3) clear ; systemctl stop cybervpn && systemctl disable cybervpn && systemctl daemon-reload ;;
4) clear ; menu;;
esac

exec bash

function instalasi(){
fun_bar(){
    CMD[0]="$1"
    CMD[1]="$2"
    
    (
        # Hapus file fim jika ada
        [[ -e $HOME/fim ]] && rm -f $HOME/fim
        
        # Jalankan perintah di background dan sembunyikan output
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        
        # Buat file fim untuk menandakan selesai
        touch $HOME/fim
    ) >/dev/null 2>&1 &

    tput civis # Sembunyikan kursor
    echo -ne "  \033[0;32mProcces\033[1;37m - \033[0;33m["
    
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[97;1m#"
            sleep 0.1
        done
        
        # Jika file fim ada, hapus dan keluar dari loop
        if [[ -e $HOME/fim ]]; then
            rm -f $HOME/fim
            break
        fi
        
        echo -e "\033[0;31m]"
        sleep 1
        tput cuu1 # Kembali ke baris sebelumnya
        tput dl1   # Hapus baris sebelumnya
        echo -ne "  \033[0;32mProcess\033[1;37m - \033[0;31m["
    done
    
    echo -e "\033[0;31m]\033[1;37m -\033[1;32m OK!\033[0m"
    tput cnorm # Tampilkan kursor kembali
}
instal_bot(){
apt update && apt upgrade -y >/dev/null 2>&1
apt install -y python3 python3-pip sqlite3 wget unzip python3-venv >/dev/null 2>&1
mkdir -p /media/cybervpn
cp /media/cybervpn/var.txt /tmp || cp /root/cybervpn/var.txt /tmp
rm -rf /media/cybervpn
cd /media/
wget https://raw.githubusercontent.com/GeKaStore/autoscript-vip/main/bot/cybervpn.zip >/dev/null 2>&1
unzip -o cybervpn.zip >/dev/null 2>&1
cd cybervpn
rm -f var.txt database.db
python3 -m venv /media/cybervpn/venv
source /media/cybervpn/venv/bin/activate
pip install --upgrade pip >/dev/null 2>&1
pip install -r requirements.txt >/dev/null 2>&1
pip install pillow speedtest-cli aiohttp paramiko >/dev/null 2>&1
}
instal_aset_bot(){
wget -q -O /usr/bin/panelbot "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/panelbot.sh" && chmod +x /usr/bin/panelbot >/dev/null 2>&1

wget -q -O /usr/bin/addnoobz "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/addnoobz.sh" && chmod +x /usr/bin/addnoobz >/dev/null 2>&1

wget -q -O /media/log-install.txt "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/log-install.txt" >/dev/null 2>&1

wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/add-vless.sh" && chmod +x /usr/bin/add-vless >/dev/null 2>&1

wget -q -O /usr/bin/addtr "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/addtr.sh" && chmod +x /usr/bin/addtr >/dev/null 2>&1

wget -q -O /usr/bin/addws "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/addws.sh" && chmod +x /usr/bin/addws  >/dev/null 2>&1

wget -q -O /usr/bin/addss "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/addss.sh" && chmod +x /usr/bin/addss >/dev/null 2>&1

wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-ssh.sh" && chmod +x /usr/bin/cek-ssh >/dev/null 2>&1

wget -q -O /usr/bin/cek-ss "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-ss.sh" && chmod +x /usr/bin/cek-ss >/dev/null 2>&1

wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-tr.sh" && chmod +x /usr/bin/cek-tr >/dev/null 2>&1

wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-vless.sh" && chmod +x /usr/bin/cek-vless >/dev/null 2>&1

wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-ws.sh" && chmod +x /usr/bin/cek-ws >/dev/null 2>&1

wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/del-vless.sh" && chmod +x /usr/bin/del-vless >/dev/null 2>&1

wget -q -O /usr/bin/cek-noobz "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz >/dev/null 2>&1

wget -q -O /usr/bin/deltr "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/deltr.sh" && chmod +x /usr/bin/deltr >/dev/null 2>&1

wget -q -O /usr/bin/delws "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/delws.sh" && chmod +x /usr/bin/delws >/dev/null 2>&1

wget -q -O /usr/bin/delss "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/delss.sh" && chmod +x /usr/bin/delss >/dev/null 2>&1

wget -q -O /usr/bin/renew-ss "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/renew-ss.sh" && chmod +x /usr/bin/renew-ss >/dev/null 2>&1

wget -q -O /usr/bin/renewtr "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/renewtr.sh" && chmod +x /usr/bin/renewtr >/dev/null 2>&1

wget -q -O /usr/bin/renewvless "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/renewvless.sh" && chmod +x /usr/bin/renewvless >/dev/null 2>&1

wget -q -O /usr/bin/renewws "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/renewws.sh" && chmod +x /usr/bin/renewws >/dev/null 2>&1

wget -q -O /usr/bin/cek-mws "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-mws.sh" && chmod +x /usr/bin/cek-mws >/dev/null 2>&1

wget -q -O /usr/bin/cek-mvs "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-mvs.sh" && chmod +x /usr/bin/cek-mvs >/dev/null 2>&1

wget -q -O /usr/bin/cek-mss "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-mss.sh" && chmod +x /usr/bin/cek-mss >/dev/null 2>&1

wget -q -O /usr/bin/cek-mts "https://raw.githubusercontent.com/GeKaStore/ubdeb10_20_/main/bot/cek-mts.sh" && chmod +x /usr/bin/cek-mts >/dev/null 2>&1
# Continue with other wget and chmod commands for remaining assets...

cp /tmp/var.txt /media/cybervpn
}
start_instalasi
setup_bot
aset_bot
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[44;97;1m            WUZZSTORE              \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\e[96;1m KETIK /menu : .menu : .crot : .gas DI BOT TELEGRAM ANDA \e[0m"
echo -e ""
read -p "Press !! ENTER Back To Menu"
rm /media/cybervpn.zip
clear
menu
}

function start_instalasi(){
lane_atas
echo -e "${BIBlue}│ ${BGCOLOR}         PROCCESS INSTALASI BOT         ${NC}${BIBlue} │${NC}"
lane_bawah
fun_bar 'instal_bot'
}

function setup_bot(){
echo -e "\nINSTALL BOT CREATE SSH via TELEGRAM"
read -e -p "[*] Input Your Id Telegram: " admin
read -e -p "[*] Input Your Bot Telegram: " token
read -e -p "[*] Input Username Telegram: " user
cat > /media/cybervpn/var.txt << END
ADMIN="$admin"
BOT_TOKEN="$token"
DOMAIN="$DOMAIN"
PUB="7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"
OWN="$user"
SALDO="100000"
END

clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[44;97;1m     CREATE BOT SUCCESSFULLY        \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[96;1m Api Token     : $token"
echo -e "\e[96;1m ID Telegram   : $admin"
echo -e "\e[96;1m Domain vps    : $DOMAIN"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\e[91;1m Wait in 4 seconds.....\e[0m"
sleep 4
clear
rm -f /usr/bin/nenen
echo -e '#!/bin/bash\ncd /media/\nsource /media/cybervpn/venv/bin/activate && python3 -m cybervpn' > /usr/bin/nenen
chmod 777 /usr/bin/nenen

# Setup systemd service
cat > /etc/systemd/system/cybervpn.service << END
[Unit]
Description=Simple CyberVPN - @CyberVPN
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/nenen
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start cybervpn
systemctl enable cybervpn
}

function aset_bot(){
lane_atas
echo -e "${BIBlue}│ ${BGCOLOR}      PROCCESS INSTALASI ASET BOT       ${NC}${BIBlue} │${NC}"
lane_bawah
fun_bar 'instal_aset_bot'
}