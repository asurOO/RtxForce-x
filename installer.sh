#!/bin/bash

# Display banner
echo
echo "🌟 Installing RtxForce-X Telegram Forwarder"
echo

# Clone repo to temporary folder
cd /tmp || exit
rm -rf RtxForce-x
git clone https://github.com/asurOO/RtxForce-x.git
cd RtxForce-x || exit 

pip install telethon
python3 -m venv venv
source venv/bin/activate

# Make script executable
chmod +x rtxforce.sh

# Run the main script
./rtxforce.sh
