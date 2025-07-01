#!/bin/bash

clear

# 🛠 Ensure lolcat is installed
command -v lolcat >/dev/null 2>&1 || {
    echo "🌈 Installing lolcat..."
    apt update && apt install lolcat -y
}

# 🛠 Ensure Python modules are installed
pip show rich pyfiglet >/dev/null 2>&1 || {
    echo "🐍 Installing required Python packages..."
    pip install rich pyfiglet
}

# 🧾 Show UI header using Python
python3 ui.py

# ⚙️ User input
read -p "⚙️ Enter Your App ID: " appid
read -p "⚙️ Enter Your App Hash: " apphash
read -p "📞 Enter Your Phone Number: " number

# 🔧 Replace placeholders in forward.py
sed -i "s|APP_ID_REPLACE|$appid|g" forward.py
sed -i "s|APP_HASH_REPLACE|$apphash|g" forward.py

# 📲 Login to Telegram
python3 forward.py login "$number"

# 🔁 Forwarding section
clear
figlet -f big "FORCE - X" | lolcat
echo -e "\e[91mTool by Rtxconfigz Team\e[0m     \e[97m[v1]\e[0m"

read -p "📦 Source Link (e.g. https://t.me/c/xxxx/xxx): " source
read -p "🎯 Target Channel: " target
read -p "🔁 Resume from link (or blank to start all): " link

msg_id=0
[[ ! -z "$link" ]] && msg_id=$(echo "$link" | awk -F'/' '{print $6}')
source_id=$(echo "$source" | awk -F'/' '{print $5}')

# 🚀 Start forwarding
python3 forward.py forward "$source_id" "$target" "$msg_id"
