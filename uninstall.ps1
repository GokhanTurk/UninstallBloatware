if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You must run it as administrator!"
    Ping 127.0.0.1 | Out-Null
    Exit
    }
    if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Invoke-RestMethod "https://raw.githubusercontent.com/GokhanTurk/FormatSonrasi.bat/main/SilentWinget.ps1" | Invoke-Expression
    }
    winget install 7zip.7zip -h --accept-source-agreements --accept-package-agreements
    
    $appsToUninstall = @(
        "Microsoft.SkypeApp_kzf8qxf38zg5c",
        "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe",
        "Microsoft.MixedReality.Portal_8wekyb3d8bbwe",
        "SpotifyAB.SpotifyMusic_zpdnekdrzrea0",
        "Microsoft.YourPhone_8wekyb3d8bbwe",
        "Microsoft.549981C3F5F10_8wekyb3d8bbwe",
        "Microsoft.BingFinance_8wekyb3d8bbwe",
        "Microsoft.BingSports_8wekyb3d8bbwe",
        "Microsoft.People_8wekyb3d8bbwe",
        "Disney.37853FC22B2CE_6rarf9sa4v8jt",
        "Microsoft.GetHelp_8wekyb3d8bbwe",
        "Microsoft.Getstarted_8wekyb3d8bbwe",
        "Microsoft.Wallet_8wekyb3d8bbwe",
        "Microsoft.Office.OneNote_8wekyb3d8bbwe",
        "Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe",
        "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe",
        "Microsoft.3DBuilder_8wekyb3d8bbwe",
        "Microsoft.BingWeather_8wekyb3d8bbwe",
        "Microsoft.ZuneMusic_8wekyb3d8bbwe",
        "Microsoft.ZuneVideo_8wekyb3d8bbwe",
        "Microsoft.BingNews_8wekyb3d8bbwe",
        "Microsoft.WindowsAlarms_8wekyb3d8bbwe",
        "Microsoft.WindowsCamera_8wekyb3d8bbwe",
        "Microsoft.WindowsMaps_8wekyb3d8bbwe",
        "Microsoft.WindowsPhone_8wekyb3d8bbwe",
        "Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe",
        "Microsoft.XboxIdentityProvider_8wekyb3d8bbwe",
        "Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe",
        "Microsoft.ConnectivityStore_8wekyb3d8bbwe",
        "Microsoft.Messaging_8wekyb3d8bbwe",
        "Microsoft.Office.Sway_8wekyb3d8bbwe",
        "Microsoft.OneConnect_8wekyb3d8bbwe",
        "Microsoft.XboxApp_8wekyb3d8bbwe",
        "Microsoft.BingNews_8wekyb3d8bbwe",
        "Clipchamp.Clipchamp_yxz26nhyzhsrt",
        "Microsoft.Todos_8wekyb3d8bbwe",
        "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe",
        "Microsoft.XboxGamingOverlay_8wekyb3d8bbwe",
        "Microsoft.XboxGameOverlay_8wekyb3d8bbwe",
        "Microsoft.Xbox.TCUI_8wekyb3d8bbwe"
    )
    
    foreach ($app in $appsToUninstall) {
        winget uninstall $app -h
    }
    
    Pause    