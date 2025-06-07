#!/bin/bash

# ==========================
# Auto System Updater Script
# Author : Ildhaaannnnnnn
# Version: 2.0
# ==========================

VERSION="1.2"
SELF_UPDATE_URL="https://raw.githubusercontent.com/Ildhaaannnnnnn/scriptup/main/scriptup.sh"
VERSION_CHECK_URL="https://raw.githubusercontent.com/Ildhaaannnnnnn/scriptup/main/version.txt"

LOGFILE="update-$(date +%Y%m%d-%H%M%S).log"
touch "$LOGFILE"

banner() {
    echo -e "\n==========[ AUTO SYSTEM UPDATE ]==========\n"
}

check_self_update() {
    echo "[*] Checking for script updates..."
    latest_version=$(curl -s "$VERSION_CHECK_URL")

    if [[ "$latest_version" != "$VERSION" ]]; then
        echo "[!] New version available: $latest_version"
        echo "[*] Updating script..."
        curl -s -o "$0" "$SELF_UPDATE_URL"
        chmod +x "$0"
        echo "[+] Script updated to version $latest_version. Please re-run."
        exit 0
    else
        echo "[✓] You're using the latest version ($VERSION)."
    fi
}

check_internet() {
    echo "[*] Checking internet connection..."
    if ! ping -c 1 8.8.8.8 >/dev/null 2>&1; then
        echo "[!] No internet. Exiting."
        exit 1
    fi
    echo "[+] Internet OK."
}

detect_pkg_manager() {
   if command -v apt >/dev/null 2>&1; then
    PM="apt"
    UPDATE="sudo apt update"
    UPGRADE="sudo apt full-upgrade -y"

   elif command -v dnf >/dev/null 2>&1; then
    PM="dnf"
    UPDATE="sudo dnf check-update"
    UPGRADE="sudo dnf upgrade -y"

   elif command -v yum >/dev/null 2>&1; then
    PM="yum"
    UPDATE="sudo yum check-update"
    UPGRADE="sudo yum upgrade -y"

   elif command -v pacman >/dev/null 2>&1; then
    PM="pacman"
    UPDATE="sudo pacman -Sy"
    UPGRADE="sudo pacman -Su --noconfirm"

   elif command -v zypper >/dev/null 2>&1; then
    PM="zypper"
    UPDATE="sudo zypper refresh"
    UPGRADE="sudo zypper update -y"

   elif command -v apk >/dev/null 2>&1; then
    PM="apk"
    UPDATE="sudo apk update"
    UPGRADE="sudo apk upgrade"
 else
    echo "[!] No supported package manager found!"
    exit 1
fi

    echo "[+] Package manager detected: $PM"
}

perform_update() {
    echo "[*] Starting system update..."
    {
        echo "Running: $UPDATE_CMD"
        eval "$UPDATE_CMD"

        if [ -n "$UPGRADE_CMD" ]; then
            echo "Running: $UPGRADE_CMD"
            eval "$UPGRADE_CMD"
        fi

        echo "[+] Update completed at $(date)"
    } | tee -a "$LOGFILE"
}

# ========================== MAIN ==========================
check_self_update
banner
check_internet
detect_pkg_manager
perform_update

echo -e "\n[\u2714] All done! Log saved to $LOGFILE"