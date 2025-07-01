#!/bin/bash

echo
echo "🌟 Installing RtxForce-X Telegram Forwarder"
echo

# 🧹 Step 1: Clean and clone repo
cd /tmp || exit 1
rm -rf RtxForce-x
git clone https://github.com/asurOO/RtxForce-x.git || {
    echo "❌ Failed to clone repo."
    exit 1
}
cd RtxForce-x || exit 1

# 🧪 Step 2: Create Python virtual environment
if [ ! -d "venv" ]; then
    echo "📦 Creating Python virtual environment..."
    python3 -m venv venv || {
        echo "❌ Failed to create venv"
        exit 1
    }
fi

# 🧪 Step 3: Activate venv
source venv/bin/activate || {
    echo "❌ Failed to activate venv"
    exit 1
}

# 📦 Step 4: Install Python packages
if [ -f "requirements.txt" ]; then
    echo "📦 Installing Python packages from requirements.txt..."
    pip install --upgrade pip
    pip install -r requirements.txt || {
        echo "❌ Failed to install packages"
        exit 1
    }
else
    echo "⚠️ requirements.txt not found. Installing manually..."
    pip install telethon rich pyfiglet
fi

# ✅ Step 5: Make main script executable
chmod +x rtxforce.sh

# 🚀 Step 6: Run the main tool
./rtxforce.sh
