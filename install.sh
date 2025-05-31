#!/bin/bash

# ===============================================
# ScriptUp Installer 
# Author  : Ildhaaannnnnnn
# Version : 1.2
# ===============================================

APP_NAME="scriptup"
INSTALL_PATH="/usr/local/bin/$APP_NAME"
REMOTE_REPO="https://raw.githubusercontent.com/Ildhaaannnnnnn/ScriptUp/main/scriptup.sh"

echo "[*] Installing $APP_NAME..."

# Check if scriptup.sh exists locally
if [ ! -f scriptup.sh ]; then
    echo "[!] scriptup.sh not found in the current directory."
    echo "[*] Attempting to download the latest version..."

    if ! curl -fsSL "$REMOTE_REPO" -o scriptup.sh; then
        echo "[✗] Failed to download scriptup.sh. Please check your internet connection or the repository URL."
        exit 1
    fi
    echo "[✓] Downloaded latest version of scriptup.sh."
fi

# Make it executable
chmod +x scriptup.sh

# Install to /usr/local/bin
sudo cp scriptup.sh "$INSTALL_PATH"

# Add update checker (optional logic in /usr/local/bin/scriptup)
echo "[*] Enabling version check..."

cat << 'EOF' | sudo tee /usr/local/bin/.scriptup_version_checker >/dev/null
#!/bin/bash

# Auto-update checker for ScriptUp
CURRENT_VERSION="1.2"
LATEST_VERSION=$(curl -fsSL https://raw.githubusercontent.com/Ildhaaannnnnnn/ScriptUp/main/VERSION 2>/dev/null)

if [ -n "$LATEST_VERSION" ] && [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "[!] A new version of ScriptUp is available: $LATEST_VERSION"
    echo "    Visit the repository to update: https://github.com/Ildhaaannnnnnn/ScriptUp"
fi
EOF

sudo chmod +x /usr/local/bin/.scriptup_version_checker

# Modify scriptup.sh to run the update checker automatically (optional)
if ! grep -q "/usr/local/bin/.scriptup_version_checker" "$INSTALL_PATH"; then
    sudo sed -i '2i/usr/local/bin/.scriptup_version_checker >/dev/null &' "$INSTALL_PATH"
fi

echo "[✓] Installation complete."
echo "You can now run '$APP_NAME' from any terminal."