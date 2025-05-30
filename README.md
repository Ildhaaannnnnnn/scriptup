<p align="center">
   <img src="logo.png" width="250" alt="scrip automatic update && upgrade">
</p>

# 🔄 AutoUpSys

> Advanced multi-distro Linux update & upgrade script with smart detection and logging.

AutoUpSys is a simple yet powerful shell script that automates system updates across multiple Linux distributions. It checks your internet connection, detects your package manager, and performs updates and upgrades automatically. Ideal for hackers, sysadmins, or power users who want one script that *just works* across different systems.

---

## ⚙️ Features

- ✅ Multi-distro support (Debian, Ubuntu, Arch, Fedora, CentOS, openSUSE)
- 🌐 Internet connectivity check before updating
- 🔍 Auto-detection of package manager (`apt`, `dnf`, `yum`, `pacman`, `zypper`)
- 📄 Generates log file with timestamps (e.g., `update-20250530-123456.log`)
- 🧠 Clean, hacker-friendly code — no AI-ish style

---

## 🚀 Usage

```bash
# Make it executable
chmod +x AutoUpSys.sh

# Run the script
./AutoUpSys.sh
```

---

## 📁 Output Example

```bash
[*] Checking internet connection...
[+] Internet OK.
[+] Package manager detected: apt
[*] Starting system update...
Running: sudo apt update
Running: sudo apt full-upgrade -y
[+] Update completed at Fri May 30 14:21:04 2025
[✔] All done! Log saved to update-20250530-142104.log
```
---

## 🧠 Notes
- Requires ```sudo``` privileges.
- Make sure your system is connected to the internet.
- Logs are stored in the same folder with a timestamp format.