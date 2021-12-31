---
id: R7Vx8irklYSvvgeDu74oF
title: Misc
desc: ''
updated: 1640938870354
created: 1640938802227
---

## Misc
Some Stuff

### Numbercount
Helps when the index of a string needs to be analyzed

```
0123456748901234567890123456789012345678901234567890123456789012345678901234567890123456798012345678901234567890123456798
           10        20        30        40        50        60        70        90        100       110       120
```

### Apple USB Ethernet
. Download the latest version of Boot Camp Support Software from Apple, they contain the necessary drivers. You can find it https://support.apple.com/downloads/macoscomponents[here]. (Around 260 MB)
. Open the ZIP-file and browse to `BootCamp\Drivers\Asix`
. Run the file `AsixSetup64.exe` and go through the installation choosing the default options.
. You are now done! Connect the USB Ethernet dongle and enjoy!

http://www.mobilechronicles.com/2016/08/17/how-to-install-drivers-for-the-apple-usb-ethernet-adapter-on-windows/[Source]


### Windows Features deactivated by administrator
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Programs\NoWindowsFeatures

from 1 to 0 ( + reboot) fixed it for me. It's a registry change, so make sure you take the usual precautions.


### Batch File - use local path when run as admin
```batch
setlocal
cd /d %~dp0
```

