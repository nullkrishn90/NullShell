# NullShell

**Build Android APKs *and* pure Java (JVM) apps — right inside Termux.**
No Android Studio. No Gradle. No PC. Just one command.

![Platform](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge)
![Language](https://img.shields.io/badge/Java%20%2B%20Android-Build-red?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-2.1-green?style=for-the-badge)

---

## 👤 Owner

<div align="center">

**Hari Jadhav Ji**

| Platform | Handle | Link |
|---|---|---|
| 💬 Telegram | `nullkrishn` | https://t.me/nullkrishn |
| 🐙 GitHub | `nullkrishn3` | https://github.com/nullkrishn3 |
| 📸 Instagram | `ur_.krishn_02` | https://instagram.com/ur_.krishn._02 |

</div>

> **NullShell** is created and owned by **Hari Jadhav Ji**. The owner block is tamper-protected.

---

## ✨ Two build modes (auto-detected)

| Mode | When | Output |
|---|---|---|
| 🤖 **Android APK** | folder has `AndroidManifest.xml` | signed `.apk` |
| ☕ **Pure Java (JVM)** | folder has `.java` with `public static void main(...)` | runnable `.jar` (+ `run.sh`) |

NullShell auto-detects which one to do. Force with `--apk` or `--jar`.

---

## ✨ Features

- 🚀 **One command** — `NullShell` and you get a build.
- ☕ **Pure Java apps** — console apps, Swing/`JOptionPane` dialog apps → runnable JAR.
- 🧩 **Multi-dex** — big Android apps get `classes.dex`, `classes2.dex`, ...
- 📚 **Library support** — `libs/*.jar` (or `jars/`, `app/libs/`) → classpath **and** dex.
- 🧱 **Native libs** — `lib/<abi>/*.so`, `jniLibs/` packed into the APK.
- 🏗️ **Two layouts** — flat **and** Android Studio (`app/src/main/...`).
- 🧠 **javac auto-release** — tries `--release 9 → 8 → 11 → 17`.
- ⚙️ **Config file** — `nullshell.conf`.
- 🔑 **Custom keystore** — sign with your own key.
- 🧹 **`--clean`** · 📄 build logs · 🧠 clear error hints.
- 📱 **Installs on ANY device (Android 5 → 16+)** — forces `minSdk 21` / `targetSdk 30`.
- 📦 **Bundled `android.jar`** — offline APK builds.
- 🌈 **Big colorful banner**; screen clears before build.
- 🌐 **Global command** — `NullShell` from any folder.
- 🛡️ **Tamper protected** owner block.

---

## 📥 Installation

```bash
pkg update && pkg upgrade -y
termux-setup-storage
bash install.sh            # from inside the NullShell folder
```

> ⚠️ **`Is a directory` error?** The ZIP extracts to a **folder** named `NullShell`.
> Run `bash ~/NullShell/nullshell`, or `bash ~/NullShell/install.sh` once.

---

## 🚀 Usage

**Android app:**
```bash
mkdir -p ~/myapp && cd ~/myapp
# AndroidManifest.xml + src/ + res/ ...
NullShell
# -> ~/myapp/NullShell/<AppName>.apk
```

**Pure Java app:**
```bash
mkdir -p ~/javafolder && cd ~/javafolder
# put your .java files (with main) — e.g. in a folder named "Java"
NullShell
# -> ~/javafolder/NullShell/<Name>.jar   and   run.sh
java -jar NullShell/app.jar
```

| Command | What it does |
|---|---|
| `NullShell` | Auto-detect and build the current folder |
| `NullShell <dir>` | Build the given folder |
| `NullShell --jar [dir]` | Force pure Java `.jar` build |
| `NullShell --run [dir]` | Pure Java build **+ run** |
| `NullShell --all [dir]` | Build **every** sub-project in the folder |
| `NullShell --apk [dir]` | Force Android APK build |
| `NullShell --setup` | Install tools only |
| `NullShell --install` | Install as a global command |
| `NullShell --clean [dir]` | Remove build artifacts |
| `NullShell --owner` / `--help` | Info |

---

## 🧪 Build everything with ONE command

The package ships two ready folders:

```
app/    -> Android sample (AndroidManifest.xml + src/ + res/)
Java/   -> Pure Java sample (HelloJava.java with main())
```

**From the NullShell folder, one command builds BOTH:**

```bash
cd ~/NullShell
NullShell            # -> builds app/ (APK) AND Java/ (JAR) automatically
```

NullShell auto-detects: if the current folder has no project but has sub-folders
that do, it builds **every** one of them. (Force it any time with `NullShell --all`.)

Or build just one:

```bash
NullShell app        # -> app/NullShell/<AppName>.apk
NullShell Java       # -> Java/NullShell/app.jar
NullShell --run Java # build Java + run it
```

Whatever code is inside a folder (small or huge), `NullShell` builds it.

---

## ⚙️ Config file — `nullshell.conf`

```ini
MIN_SDK=21
TARGET_SDK=30
APP_NAME=MyApp
JAVAC_RELEASE=            # blank = auto
# KEYSTORE=/sdcard/my.keystore
# KS_PASS=password
# KS_ALIAS=mykey
SKIP_SIGN=
```

---

## 📁 Layouts it understands

**Android (flat):** `AndroidManifest.xml` · `src/` · `res/` · `assets/` · `libs/` · `lib/`

**Android (Studio):** `app/src/main/{AndroidManifest.xml,java,res,assets}` · `app/libs/`

**Pure Java:** any `.java` in the folder / `src/` / `java/` / `Java/` — with `main()`.

---

## 🔧 How it works

**Android:** `aapt2 compile → aapt2 link → javac → d8 (multi-dex) → zip+zipalign → apksigner`

**Java:** `javac → detect main() → jar cfm → runnable .jar (+ run.sh)`

---

## ⚠️ Honest limits

- Java/Android **framework** builder — **no Gradle dependency resolution** (provide jars in `libs/`).
- No tool guarantees "zero errors for any code". NullShell gives clear errors + hints + logs.
- `minSdk`/`targetSdk` forced for install compatibility (override in `nullshell.conf`).
- Swing/GUI apps compile into a JAR, but running a GUI needs a display (Termux is headless).

---

## 📜 License

MIT. Created and owned by **Hari Jadhav Ji** — keep the credits intact.

<div align="center">

**Made with ❤️ by Hari Jadhav Ji**
Telegram [@nullkrishn](https://t.me/nullkrishn) · GitHub [@nullkrishn3](https://github.com/nullkrishn3) · Instagram [@ur_.krishn_02](https://instagram.com/ur_.krishn._02)

</div>
