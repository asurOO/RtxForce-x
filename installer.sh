#!/bin/bash

# 🌟 Banner
echo
echo "🌟 Installing RtxForce-X Telegram Forwarder"
echo

# 🧹 Clean + Clone repo to temporary folder
cd /tmp || exit 1
rm -rf RtxForce-x
git clone https://github.com/asurOO/RtxForce-x.git || {
    echo "❌ Failed to clone repo."
    exit 1
}
cd RtxForce-x || exit 1

# 🧪 Create & activate virtual environment
python3 -m venv venv
source venv/bin/activate

# 📦 Install Python dependencies
echo "📦 Installing Python packages (telethon, rich, pyfiglet)..."
pip install --upgrade pip >/dev/null
pip install -r requirements.txt || pip install telethon rich pyfiglet

# ✅ Make main script executable
chmod +x rtxforce.sh

# 🚀 Run the main tool
./rtxforce.sh
