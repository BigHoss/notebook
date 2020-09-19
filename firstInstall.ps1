Set-ExecutionPolicy Bypass

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n=allowGlobalConfirmation

# powershell Powerline
# add win term to shell https://github.com/lextm/windowsterminal-shell
choco install powershell-core
choco install microsoft-windows-terminal
choco install cascadiacodepl
choco install cascadiamonopl
install-module posh-git
install-module oh-my-posh
install-module -Name PSReadLine -Force -SkipPublisherCheck

git clone https://github.com/lextm/windowsterminal-shell.git
./windowsterminal-shell/install.ps1 mini

Add-Content $profile "Import-Module posh-git\r\nImport-Module oh-my-posh\r\nSet-Theme Paradox"

#first
choco install googlechrome 
choco install powertoys
choco install directoryopus
choco install 1password
choco install 7zip 
choco install visualstudio2019professional
choco install visualstudio2019-workload-databuildtools
choco install visualstudio2019-workload-data
choco install visualstudio2019-workload-netweb
choco install visualstudio2019-workload-netcoretools
choco install visualstudio2019-workload-netcorebuildtools
choco install visualstudio2019-workload-webbuildtools
choco install visualstudio2019-workload-nativedesktop
choco install visualstudio2019-workload-manageddesktop
choco install jetbrainstoolbox 
choco install dotnetcore-sdk 
choco install netfx-4.8-devpack
choco install netfx-4.7-devpack
choco install sql-server-management-studio
choco install ditto
choco install firacode
choco install nssm

choco install sql-server-2019
choco install ssms
choco install dbforge-sql-cmpl-exp

# fonts
choco install hackfont-windows
choco install firacode

# everywhere
choco install opera
choco install beyondcompare 
choco install royalts-v5
choco install lockhunter 
choco install autoruns 
choco install onenote
choco install everything /run-on-system-startup /service
choco install paint.net

#dev
choco install dotnetcore-runtime 
choco install github 
choco install visualstudiocode  
choco install linqpad5 
choco install git.install /GitAndUnixToolsOnPath /NoAutoCrlf
choco install cmder

# home
choco install ccleaner 
choco install ccenhancer
choco install teamviewer 
choco install itunes 
choco install irfanview 
choco install irfanviewplugins 
choco install mpc-hc 
choco install sharex  
choco install treesizefree 

choco install revouninstallerpro 
choco install unetbootin 
choco install teracopy 
choco install plantuml

#special
#choco -y install openssh awscli sqlite

#choco install googledrive 
#choco install steam  
#choco install spotify 
#choco install ffmpeg 
#choco install k-litecodecpackfull 
#choco install ccenhancer 
#choco install synergy 
#choco install jdownloader 
#choco install adobe-creative-cloud 
#choco install office365proplus
#choco install atom 
#choco install drmemory 
#choco install skype  
#choco install nodejs 
#choco install docker 
#choco install synctrayzor
#choco pin add -n=synctrayzor
#choco install dropbox 

#auto upgrade
choco install choco-upgrade-all-at-startup


choco feature disable -n=allowGlobalConfirmation
