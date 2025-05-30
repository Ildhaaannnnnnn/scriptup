#!/bin/bash

# ==========================
# Auto System Updater Script
# Author : Ildhaaannnnnnn
# Version: 1.2
# ==========================

LOGFILE="update-$(date +%Y%m%d-%H%M%S).log"
touch "$LOGFILE"

banner() {
    echo -e "\n==========[ AUTO SYSTEM UPDATE ]==========\n"
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
    if command -v apt &>/dev/null; then
        PM="apt"
        UPDATE_CMD="sudo apt update"
        UPGRADE_CMD="sudo apt full-upgrade -y"

    elif command -v dnf &>/dev/null; then
        PM="dnf"
        UPDATE_CMD="sudo dnf upgrade --refresh -y"
        UPGRADE_CMD=""

    elif command -v yum &>/dev/null; then
        PM="yum"
        UPDATE_CMD="sudo yum update -y"
        UPGRADE_CMD=""

    elif command -v pacman &>/dev/null; then
        PM="pacman"
        UPDATE_CMD="sudo pacman -Syu --noconfirm"
        UPGRADE_CMD=""

    elif command -v zypper &>/dev/null; then
        PM="zypper"
        UPDATE_CMD="sudo zypper refresh"
        UPGRADE_CMD="sudo zypper update -y"

    else
        echo "[!] Unsupported distro. Exiting."
        exit 2
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

banner
check_internet
detect_pkg_manager
perform_update

echo -e "\n[\u2714] All done! Log saved to $LOGFILE"