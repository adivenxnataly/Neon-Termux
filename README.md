### Neon Termux Installer
![Neon](https://github.com/adivenxnataly/Neon-termux/blob/main/files/neon-termux_banner.png)
**Neon** is a Advanced Bundler Installer for Termux, Install XAPK/APKM packages with root or ADB.

#### Requirements
- Android device with **Termux installed**
- **Root** or **ADB** access: if you dont have root and haven't connected termux to ADB? click [here](https://gist.github.com/kairusds/1d4e32d3cf0d6ca44dc126c1a383a48d) for instructions

#### Installation
```shell
apt update -y && apt upgrade -y
apt install wget -y
wget https://github.com/adivenxnataly/Neon-termux/releases/download/1.0.0/neon-termux.deb
apt install ~/neon-termux.deb
```

#### Usage
```yaml
Neon - Advanced Bundle Installer for Termux v1.0.0 @adivenxnataly 2025,
Install XAPK/APKM packages with root or ADB.

usage: neon [options] <package>

required arguments:
  package             : Path to XAPK/APKM file

optional options:
  -h, --help          : Show this help message and exit
  -v, --version       : Show version information
  -q, --quiet         : Suppress output messages
  -n, --no-clean      : Keep extracted files after installation

flags:
  -d                  : Allow version code downgrade
  -t                  : Allow test packages installation
  -r                  : Replace existing application
  -i                  : Specify installer package name

advanced options:
  --install-options   : Custom installation options (based on `pm install` arguments)
  --adb-port <port>   : ADB server port (default: 5555)
```
#### Advanced options: argument usage
##### Install Options
```shell
neon --install-option="--bypass-verification --bypass-low-target-sdk-block" /path/to/bundle.xapk
```
>[!NOTE]
> Using `--install-option` allows you to use flags according to the SDK version, where each SDK has different flag rules, such as `-t` for testing, but on Android 13 (SDK 33) the use of flags to `--test-only` is a recognized flag. like the above flag `--bypass-low-target-sdk` is not be available on Android 12 (SDK 31).

##### ADB Port
by default the port will use `55555` which will not connect automatically even if **Wireless Debugging** is on (but not connected to termux yet), so I added an option to do: `adb connect ip-address:port` directly together with the command just by entering a valid port, which you can see in: <br>
> Developer Options -> Wireless Debugging -> IP Address & Port
![adb-port](https://github.com/adivenxnataly/Neon-termux/blob/main/files/adb-port.jpg)
```shell
neon --adb-port 45817 /path/to/bundle.apkm
```
this will make it automatically connect to adb, and run the installation directly.

**ADB Port & Flags**
```shell
neon --adb-port 45817 -d -t /path/to/bundle.xapk
```

**ADB Port & Install Options**
```shell
neon --adb-port 45817 --install-option="--bypass-low-target-sdk-block --test-only" /path/to/bundle.apkm
```

#### Credit
[adivenxnataly](https://github.com/adivenxnataly) - this is my own project.
