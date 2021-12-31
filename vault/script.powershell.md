---
id: FjmejMFSyzK8TEgbSzDVN
title: Powershell
desc: ''
updated: 1640938718788
created: 1640938707129
---

# Powershell stuff

### Run on doubleclick
Regedit
`HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\open\command`

Set to
`"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -noLogo -ExecutionPolicy unrestricted -file "%1"`


### Proxy for Powershell
```powershell
$proxy='http://<IP>:<PORT>'

$ENV:HTTP_PROXY=$proxy 
$ENV:HTTPS_PROXY=$proxy
```

### Check if UserProfile already exists
```powershell
Test-Path $profile
```

### Create UserProfile
```powershell
New-Item -ItemType file -Force $profile
```

### Save windows credentials with password to xml
```powershell
Get-Credential -Credential "<domain>\<username>" | Export-Clixml password.xml
```

### add to userprofile .ps1
Normally saved at: ```%Userprofile%\Documents\WindowsPowerShell```

```powershell
$MyProxy='https://<proxy:port>'
$MyProxyPassword = Import-Clixml -Path "<full path to password.xml>"
$WebClient = New-Object System.Net.WebClient
$proxy = New-Object System.Net.WebProxy $MyProxy
$proxy.Credentials = $MyProxyPassword
$Webclient.proxy = $proxy
```


### Fastest copy

```powershell
robocopy T:\StdXml_Backup_Golive_20200828 T:\Transfer\IN_StandardXml /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
```
[SOurce](https://pureinfotech.com/robocopy-transfer-files-fast-network-windows-10/)
