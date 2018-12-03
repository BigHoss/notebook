# Powershell stuff

### Run on doubleclick
Regedit
`HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\open\command`

Set to
`"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -noLogo -ExecutionPolicy unrestricted -file "%1"`
