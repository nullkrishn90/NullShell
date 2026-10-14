<!--
  ⚠️ IMPORTANT: For the images to show, upload these files to the SAME folder as this README:
      NullShell_banner.png
      NullShell_logo.png
      NullShell_demo.gif
  Then GitHub will render them automatically.
-->

<div align="center">

<img src="NullShell_banner.png" alt="NullShell" width="800">

# 🐚 NullShell

**Build Android APKs & pure Java apps — from your terminal, in one command.**

[![Termux](https://img.shields.io/badge/Termux-0B0B0F?style=for-the-badge&logo=android&logoColor=3DDC84)](https://termux.dev)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://kernel.org)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com)
[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://microsoft.com/windows)
![License](https://img.shields.io/badge/License-MIT-00E5FF?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-2.2-D500F9?style=for-the-badge)

<img src="NullShell_demo.gif" alt="NullShell demo" width="740">

</div>

---

## 👤 Owner

| | Handle | Link |
|:--:|:--|:--|
| 💬 | Telegram | [@nullkrishn](https://t.me/nullkrishn) |
| 🐙 | GitHub | [@nullkrishn3](https://github.com/nullkrishn3) |
| 📸 | Instagram | [@ur_.krishn_02](https://instagram.com/ur_.krishn._02) |

> 🛡️ NullShell is created & owned by **Hari Jadhav Ji**. The owner block is **tamper-protected**.

---

## 📖 What is NullShell?

NullShell turns a folder of code into a finished app — **one command**:

- 🟢 **Android APK** — Java + `AndroidManifest.xml` → signed, installable `.apk`
- 🟠 **Pure Java (JVM)** — `.java` with `main()` → runnable `.jar`

No Android Studio. No Gradle. No PC.

```bash
cd ~/NullShell
NullShell        # builds everything inside
```

---

## 🚀 Install (one time)

**🟢 Termux**
```bash
pkg update && pkg upgrade -y
pkg install -y git
git clone https://github.com/nullkrishn3/NullShell.git
cd NullShell && bash install.sh
```

**🐧 Linux / 🍎 macOS**
```bash
sudo apt install -y openjdk-17-jdk zip unzip
git clone https://github.com/nullkrishn3/NullShell.git
cd NullShell && bash NullShell --install
```

**🐳 Docker (any OS)**
```bash
docker build -t nullshell .
docker run --rm -v "$PWD/projects:/work" nullshell --all /work
```

**🪟 Windows** → use **WSL2** or **Docker**.

---

## ⚡ Quick start

```bash
cd app && NullShell                        # -> APK
cd ../Java && NullShell                    # -> JAR
java -jar NullShell/app.jar                # run it
```

---

## 🧾 Commands

| Command | Description |
|:--|:--|
| `NullShell` | Auto-detect & build current folder (or every sub-project) |
| `NullShell <dir>` | Build the given folder |
| `NullShell --apk [dir]` | Force Android APK build |
| `NullShell --jar [dir]` | Force Pure Java `.jar` build |
| `NullShell --run [dir]` | Build Java + run it |
| `NullShell --all [dir]` | Build every sub-project |
| `NullShell --setup` | Install tools only |
| `NullShell --install` | Install the global command |
| `NullShell --clean [dir]` | Remove build artifacts |
| `NullShell --owner` | Owner details |
| `NullShell --help` | Help |

---

## ✨ Features

- 🚀 One-command build — builds every sub-project automatically
- 📦 Bundled `android.jar` — offline APK builds
- 🧩 Multi-dex — `classes.dex`, `classes2.dex`, ...
- 📚 Library support — `libs/*.jar` → classpath + dex
- 🧱 Native libs — `lib/<abi>/*.so`, `jniLibs/` packed into the APK
- 🏗️ Flat **and** Android Studio layouts (`app/src/main/...`)
- 🪄 Auto package-name if the manifest has none
- 🧠 javac auto-release (9 → 8 → 11 → 17)
- 🔐 APK signing (v1 + v2 + v3) + verify
- 📱 Installs on **Android 5 → 16+** (forces `minSdk 21` / `targetSdk 30`)
- 🌈 Big colorful banner · 🛡️ tamper-protected owner block

---

## 🧯 Troubleshooting

| 😖 Error | ✅ Fix |
|:--|:--|
| `Is a directory` | Run `bash NullShell/nullshell` or `bash NullShell/install.sh` |
| `Unable to access jarfile` | Build first (`NullShell`), then `java -jar NullShell/app.jar` |
| `package ... does not exist` | Put the library's `.jar` in `libs/` |
| `App not installed` | Uninstall old version, or tap "Install anyway" |

---

## 📜 License

**MIT** — created & owned by **Hari Jadhav Ji**. Keep the credits intact.

<div align="center">

**Made with ❤️ by Hari Jadhav Ji**

[Telegram](https://t.me/nullkrishn) · [GitHub](https://github.com/nullkrishn3) · [Instagram](https://ur_.krishn_02)

⭐ If NullShell helped you, star the repo!

</div>
