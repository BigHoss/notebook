# command to run this file directly:
# copy and run this in a pwsh terminal
# iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/BigHoss/notebook/blob/258076ca65404225dd3977879a8d193c51198c60/firstInstall.ps1'))


Set-ExecutionPolicy Bypass

# dotnet
iex ((New-Object System.Net.WebClient).DownloadString('https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1'))

#chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n=allowGlobalConfirmation

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

# powershell Powerline
# add win term to shell https://github.com/lextm/windowsterminal-shell
choco install powershell-core
choco install microsoft-windows-terminal
install-module posh-git
install-module oh-my-posh
install-module -Name PSReadLine -Force -SkipPublisherCheck

git clone https://github.com/lextm/windowsterminal-shell.git
./windowsterminal-shell/install.ps1 mini

    $null = Start-ThreadJob -Name "Get version of `$profile from gist" -ArgumentList $gistUrl, $latestVersionFile, $versionRegEx -ScriptBlock {
      param ($gistUrl, $latestVersionFile, $versionRegEx)

      try {
        $gist = Invoke-RestMethod $gistUrl -ErrorAction Stop

        $gistProfile = $gist.Files."profile.ps1".Content
        [version]$gistVersion = "0.0.0"
        if ($gistProfile -match $versionRegEx) {
          $gistVersion = $matches.Version
          Set-Content -Path $latestVersionFile -Value $gistVersion
        }
      }
      catch {
        # we can hit rate limit issue with GitHub since we're using anonymous
        Write-Verbose -Verbose "Was not able to access gist to check for newer version"
      }
    }
    
    
#first
choco install brave 
choco install powertoys
choco install directoryopus
choco install bitwarden
choco install 7zip 
choco install ditto
choco install nssm
choco install opera
choco install beyondcompare 
choco install royalts-v5
choco install lockhunter 
choco install autoruns 
choco install onenote
choco install everything /run-on-system-startup /service
choco install paint.net
choco install sharex  
choco install treesizefree 
choco install revouninstallerpro 

#dev
choco install github 
choco install visualstudiocode  
choco install linqpad5 
choco install git.install /GitAndUnixToolsOnPath /NoAutoCrlf
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
choco install ghostdoc-pro

# frameworks
choco install dotnet-5.0-sdk
choco install dotnetcore-sdk 
choco install netfx-4.8-devpack

# db
choco install sql-server-2019
choco install ssms
choco install dbforge-sql-cmpl-exp
choco install postgresql

# fonts
choco install hackfont-windows
choco install firacode
choco install cascadiacodepl
choco install cascadiamonopl

# home
choco install ccleaner 
choco install ccenhancer
choco install teamviewer 
choco install itunes 
choco install irfanview 
choco install irfanviewplugins 
choco install mpc-hc 

choco install unetbootin 
choco install teracopy 
choco install umlet

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
