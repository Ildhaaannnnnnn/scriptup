# 🤝 Contributing to scriptup

Thank you for considering contributing to **AutoUpSys**! Whether you're fixing bugs, improving the docs, suggesting features, or adding support for new distros — you're helping make this project better for everyone. 🙌

---

## 🧰 Requirements

- Basic knowledge of **shell scripting (bash)**
- Linux environment to test your changes (WSL, VM, or native)
- GitHub account for forking & PR

---

## 🛠️ How to Contribute

1. **Fork this repository**  
   Click the `Fork` button on the top right of the repo page.

2. **Clone your fork locally**  
   ```bash
   git clone `https://github.com/Ildhaaannnnnnn/scriptup.git`
   cd scriptup
   ```

3. **Create a new branch**  
   ```bash
   git checkout -b my-fix-or-feature
   ```

4. **Make your changes**  
   - Follow the code style and formatting used in `scriptup.sh`
   - Use `#` for comments, and keep the script clean & readable
   - If adding support for a new distro, test it first!

5. **Commit your changes**  
   ```bash
   git add .
   git commit -m "Add: <your feature or fix>"
   ```

6. **Push to your fork**  
   ```bash
   git push origin my-fix-or-feature
   ```

7. **Open a Pull Request**  
   Go to your fork on GitHub and click **"Compare & pull request"**.

---

## 📦 Areas to Contribute

- 🌐 Add support for new Linux distributions (e.g. Alpine, Gentoo)
- 📜 Improve logging format or file structure
- 🔄 Improve detection logic for package managers
- 🧪 Add dry-run or debug mode
- 🔧 Improve `install.sh` or auto-cron support
- 📖 Enhance documentation or language quality

---

## 📄 Code Style Guidelines

- Stick to **bash best practices**
- Use `"$(command)"` instead of backticks
- Use `#!/bin/bash` on top
- Format logs with clear `[+]`, `[*]`, `[!]`, etc
- Avoid unnecessary dependencies

---

## 🧪 Testing

Please test your changes on **at least 1 real Linux distro**. If possible, use:
- Kali / Debian / Ubuntu / Arch / Fedora / openSUSE

If adding distro support, clearly mention which version was tested.

---

## 🧠 Tips

- Keep it simple. AutoUpSys should "just work" without external dependencies.
- Log everything to help users debug.
- Make it friendly for both terminal beginners and power users.

---

## 💬 Questions or Issues?

Open an [issue](https://github.com/Ildhaaannnnnnn/scriptup/issues) if you're not sure where to start or want to propose an idea.

Thanks for helping improve AutoUpSys! 💙

– Hanz (Ildhan)