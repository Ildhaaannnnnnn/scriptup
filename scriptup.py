#!/usr/bin/env python3

import os
import subprocess
import platform
import shutil
import sys

def check_internet():
    try:
        subprocess.check_output(["ping", "-c", "1", "1.1.1.1"])
        return True
    except subprocess.CalledProcessError:
        return False

def get_package_manager():
    managers = ["apt", "dnf", "yum", "pacman", "zypper", "apk"]
    for manager in managers:
        if shutil.which(manager):
            return manager
    return None

def update_system(manager):
    print(f"[+] Detected package manager: {manager}")
    if manager == "apt":
        cmds = ["sudo apt update", "sudo apt upgrade -y", "sudo apt autoremove -y"]
    elif manager == "dnf":
        cmds = ["sudo dnf upgrade --refresh -y"]
    elif manager == "yum":
        cmds = ["sudo yum update -y"]
    elif manager == "pacman":
        cmds = ["sudo pacman -Syu --noconfirm"]
    elif manager == "zypper":
        cmds = ["sudo zypper refresh", "sudo zypper update -y"]
    elif manager == "apk":
        cmds = ["sudo apk update", "sudo apk upgrade"]
    else:
        print("[-] Unsupported package manager.")
        return

    for cmd in cmds:
        print(f"[~] Running: {cmd}")
        os.system(cmd)

def main():
    print("== ScriptUp v2.0 (Python) ==")
    print(f"Running on: {platform.system()} {platform.release()}")

    if not check_internet():
        print("[-] No internet connection. Please check your network.")
        sys.exit(1)

    manager = get_package_manager()
    if not manager:
        print("[-] No supported package manager found.")
        sys.exit(1)

    update_system(manager)
    print("[✓] System update complete.")

if __name__ == "__main__":
    main()
