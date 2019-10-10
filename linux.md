# Linux / Windows Subsystem for Linux stuff

### Configure Proxy for linux bash
```sh
sudo nano /etc/apt/apt.conf.d/proxy.conf
```

## Proxy on Ubuntu
### For apt,software center etc
edit the file /etc/apt/apt.conf
And then replace all the existing text by the following lines
```sh
Acquire::http::proxy "http://username:password@host:port/";
Acquire::ftp::proxy "ftp://username:password@host:port/";
Acquire::https::proxy "https://username:password@host:port/";
```
### Environment variables
edit the file /etc/environment
And then add the following lines after PATH="something here"
```sh
http_proxy=http://username:password@host:port/
ftp_proxy=ftp://username:password@host:port/
https_proxy=https://username:password@host:port/
```

[Source](https://askubuntu.com/questions/664777/systemwide-proxy-settings-in-ubuntu)

### Samba share

`sudo smbpasswd -a <user_name>`

`sudo nano /etc/samba/smb.conf`
```
[<folder_name>]
path = /home/<user_name>/<folder_name>
valid users = <user_name>
read only = no
```

### Ubuntu Services
```bash
sudo service nginx start
sudo service nginx stop

```
