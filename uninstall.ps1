if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
Write-Warning "You must run it as administrator!"
Ping 127.0.0.1 | Out-Null
Exit
}
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
#irm "https://raw.githubusercontent.com/GokhanTurk/FormatSonrasi.bat/main/SilentWinget.ps1" | iex
Write-Warning "You must install Winget!"
}
#winget install rarlab.winrar -h --accept-source-agreements --accept-package-agreements
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c -h
winget uninstall Microsoft.XboxApp_8wekyb3d8bbwe -h
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe -h
winget uninstall Microsoft.MixedReality.Portal_8wekyb3d8bbwe -h
winget uninstall SpotifyAB.SpotifyMusic_zpdnekdrzrea0 -h
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe -h
winget uninstall Microsoft.549981C3F5F10_8wekyb3d8bbwe -h
winget uninstall Microsoft.BingFinance_8wekyb3d8bbwe -h
winget uninstall Microsoft.BingSports_8wekyb3d8bbwe -h
winget uninstall Microsoft.People_8wekyb3d8bbwe -h
winget uninstall Disney.37853FC22B2CE_6rarf9sa4v8jt -h
winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe -h
winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe -h
winget uninstall Microsoft.Wallet_8wekyb3d8bbwe -h
winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe -h
winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe -h
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe -h
winget uninstall "9P1J8S7CCWWT" -h
winget uninstall "9NCBCSZSJRSB" -h
winget uninstall "Microsoft.DevHome" -h
winget uninstall "9NBLGGH5R558" -h
winget uninstall "9NXQXXLFST89" -h
winget uninstall "MSIX\Microsoft.BingNews_4.55.62231.0_x64__8wekyb3d8bbwe" -h
winget uninstall "9NHT9RB2F4HD" -h
winget uninstall "MSIX\Microsoft.Microsoft3DViewer_7.2502.5012.0_x64__8wekyb3d8bbwe" -h
Pause
Exit
