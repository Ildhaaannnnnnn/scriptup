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
chmod +x scriptup.sh

# Run the script
./scriptup.sh
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
- I use Kali Linux WSL, it may work on some distros and some don't.

---

## 🔹Real Output 

```bash

==========[ AUTO SYSTEM UPDATE ]==========

[*] Checking internet connection...
[+] Internet OK.
[+] Package manager detected: apt
[*] Starting system update...
Running: sudo apt update
[sudo] password for void:

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Get:1 http://mirror.primelink.net.id/kali kali-rolling InRelease [41.5 kB]
Get:2 http://mirror.primelink.net.id/kali kali-rolling/main amd64 Packages [21.0 MB]

Get:3 http://mirror.primelink.net.id/kali kali-rolling/main amd64 Contents (deb) [51.9 MB]
Fetched 72.9 MB in 2min 19s (526 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
1 package can be upgraded. Run 'apt list --upgradable' to see it.
Running: sudo apt full-upgrade -y

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following package was automatically installed and is no longer required:
  dnsutils
Use 'sudo apt autoremove' to remove it.

Upgrading:
  libvpx9

Summary:
  Upgrading: 1, Installing: 0, Removing: 0, Not Upgrading: 0
  Download size: 1,115 kB
  Space needed: 0 B / 1,003 GB available

Get:1 http://xsrv.moratelindo.io/kali kali-rolling/main amd64 libvpx9 amd64 1.15.0-2.1 [1,115 kB]
Fetched 1,115 kB in 1s (1,051 kB/s)
(Reading database ... 556348 files and directories currently installed.)
Preparing to unpack .../libvpx9_1.15.0-2.1_amd64.deb ...
Unpacking libvpx9:amd64 (1.15.0-2.1) over (1.15.0-2) ...
Setting up libvpx9:amd64 (1.15.0-2.1) ...
Processing triggers for libc-bin (2.41-6) ...
[+] Update completed at Fri May 30 10:23:25 PM WIB 2025

[✔] All done! Log saved to update-20250530-222045.log
```
---

## 🔹Real Output 2

```bash

[*] Checking for script updates...
[✓] You're using the latest version (1.2).

==========[ AUTO SYSTEM UPDATE ]==========

[*] Checking internet connection...
[+] Internet OK.
[+] Package manager detected: apt
[*] Starting system update...
Running: sudo apt update

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://http.kali.org/kali kali-rolling InRelease
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Running: sudo apt full-upgrade -y

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following package was automatically installed and is no longer required:
  dnsutils
Use 'sudo apt autoremove' to remove it.

Summary:
  Upgrading: 0, Installing: 0, Removing: 0, Not Upgrading: 0
[+] Update completed at Fri May 30 11:05:42 PM WIB 2025

[✔] All done! Log saved to update-20250530-230539.log
```