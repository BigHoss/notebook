---
id: uccapjl7n0lm9kka2mmigr1
title: installation
desc: 'details to install the system'
updated: 1674991439110
created: 1674988432973
---
## Installing os on eMMC

### manuals

- [install debian 11 onto eMMC](https://paranoiaque.fr/en/2021/08/26/flash-debian-bullseye-beaglebone-black/)


## Homeassistant

- [install homeassistant](https://www.pcbway.com/project/shareproject/Homeassistant_in_Beaglebone_Black_With_Debian_11_6ffbf2fb.html)

the cryptography package has problems without rust

test with ```pip install cryptography```

[install rust](https://cwoodall.com/rusty-nail/notes/2016-12-11-setting-up-beaglebone-with-rust/)

the curl in this manual is outdated ```curl https://sh.rustup.rs -sSf | sh```


## hardware

### the proto cape

[wiki](https://elinux.org/BeagleBone_eeProto_Cape)
[suppliers page](https://www.onlogic.com/cbb-eeproto/)

## system

### backup

to backup the system i am looking for a solution

atm i connected the smb share of our server with the following command
```sudo mount -t cifs -o username=smb //192.168.178.54/Backups /mnt/towerBackups```

i think i will backup my system with rsync