param(
    [string]$Selection
)

function Get-AppDisplayNames {
    param([string[]]$AppList)
    $nameMap = @{
        "Microsoft.SkypeApp*" = "Skype"
        "Microsoft.BingNews*" = "Bing News"
        "Microsoft.GetHelp*" = "Get Help"
        "Microsoft.GetStarted*" = "Get Started"
        "Microsoft.MicrosoftSolitaireCollection*" = "Microsoft Solitaire Collection"
        "Microsoft.LinkedIn*" = "LinkedIn"
        "Microsoft.YourPhone*" = "Your Phone"
        "Microsoft.MixedReality.Portal*" = "Mixed Reality Portal"
        "Microsoft.WindowsFeedbackHub*" = "Feedback Hub"
        "Microsoft.People*" = "People"
        "Microsoft.Maps*" = "Maps"
        "SpotifyAB.SpotifyMusic_zpdnekdrzrea0" = "Spotify"
        "Microsoft.549981C3F5F10_8wekyb3d8bbwe" = "News and Interests"
        "Microsoft.BingFinance_8wekyb3d8bbwe" = "Bing Finance"
        "Microsoft.BingSports_8wekyb3d8bbwe" = "Bing Sports"
        "Disney.37853FC22B2CE_6rarf9sa4v8jt" = "Disney+"
        "Microsoft.Wallet_8wekyb3d8bbwe" = "Wallet"
        "Microsoft.Office.OneNote_8wekyb3d8bbwe" = "OneNote"
        "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe" = "Office Hub"
        "Microsoft.3DBuilder_8wekyb3d8bbwe" = "3D Builder"
        "Microsoft.BingWeather_8wekyb3d8bbwe" = "Bing Weather"
        "Microsoft.ZuneMusic_8wekyb3d8bbwe" = "Groove Music"
        "Microsoft.ZuneVideo_8wekyb3d8bbwe" = "Movies & TV"
        "Microsoft.WindowsAlarms_8wekyb3d8bbwe" = "Alarms & Clock"
        "Microsoft.WindowsCamera_8wekyb3d8bbwe" = "Camera"
        "Microsoft.WindowsMaps_8wekyb3d8bbwe" = "Maps"
        "Microsoft.WindowsPhone_8wekyb3d8bbwe" = "Your Phone"
        "Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe" = "Sound Recorder"
        "Microsoft.XboxIdentityProvider_8wekyb3d8bbwe" = "Xbox Identity Provider"
        "Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe" = "Xbox Speech to Text Overlay"
        "Microsoft.ConnectivityStore_8wekyb3d8bbwe" = "Connectivity Store"
        "Microsoft.Messaging_8wekyb3d8bbwe" = "Messaging"
        "Microsoft.Office.Sway_8wekyb3d8bbwe" = "Sway"
        "Microsoft.OneConnect_8wekyb3d8bbwe" = "OneConnect"
        "Microsoft.XboxApp_8wekyb3d8bbwe" = "Xbox App"
        "Clipchamp.Clipchamp_yxz26nhyzhsrt" = "Clipchamp"
        "Microsoft.Todos_8wekyb3d8bbwe" = "Microsoft To Do"
        "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe" = "Quick Assist"
        "Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" = "Xbox Gaming Overlay"
        "Microsoft.XboxGameOverlay_8wekyb3d8bbwe" = "Xbox Game Overlay"
        "Microsoft.Xbox.TCUI_8wekyb3d8bbwe" = "Xbox TCUI"
        "9P1J8S7CCWWT" = "Xbox Game Pass"
        "9NCBCSZSJRSB" = "Xbox Accessories"
        "Microsoft.DevHome" = "Dev Home"
        "9NBLGGH5R558" = "Microsoft To Do"
        "9NXQXXLFST89" = "Power Automate"
        "MSIX\Microsoft.BingNews_4.55.62231.0_x64__8wekyb3d8bbwe" = "Bing News MSIX"
        "9NHT9RB2F4HD" = "Family Safety"
        "MSIX\Microsoft.Microsoft3DViewer_7.2502.5012.0_x64__8wekyb3d8bbwe" = "3D Viewer MSIX"
        "Microsoft.BingSearch*" = "Bing Search"
        "Microsoft.GamingApp*" = "Xbox App (GamingApp)"
        "Microsoft.PowerAutomateDesktop*" = "Power Automate Desktop"
        "Microsoft.Windows.DevHome*" = "Dev Home"
        "MSTeams*" = "Microsoft Teams"
        "Microsoft.OutlookForWindows*" = "Outlook for Windows"
        "MicrosoftWindows.CrossDevice*" = "Cross Device Experience Host"
        "Microsoft.WindowsCalculator*" = "Calculator"
        "Microsoft.Paint*" = "Paint"
        "Microsoft.Windows.Photos*" = "Photos"
        "Microsoft.WindowsCommunicationsApps*" = "Mail and Calendar"
        "Microsoft.MicrosoftStickyNotes*" = "Sticky Notes"
        "Microsoft.ScreenSketch*" = "Snipping Tool"
        "Microsoft.WindowsMediaPlayer*" = "Windows Media Player"
    }
    $AppList | Where-Object { $_ -and $_ -ne '' } | ForEach-Object {
        $found = $null
        foreach ($key in $nameMap.Keys) {
            if ($_ -like $key) {
                $found = $nameMap[$key]
                break
            }
        }
        if ($found) {
            $found
        } else {
            $_
        }
    }
}

$null = $null # --- Admin check and elevation ---
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $script = $MyInvocation.MyCommand.Definition
    $myArgs = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $script)
    
    # If a parameter is provided and the script is running as a local file, pass the parameter
    if ($Selection) {
        $myArgs += "-Selection"
        $myArgs += $Selection
    }

    # Check if PowerShell 7 (pwsh) exists first
    $cmd = Get-Command pwsh -ErrorAction SilentlyContinue
    if ($cmd) {
        $pwshPath = $cmd.Source
        Start-Process -FilePath $pwshPath -ArgumentList $myArgs -Verb RunAs
    } else {
        Start-Process -FilePath "powershell.exe" -ArgumentList $myArgs -Verb RunAs
    }
    exit
}

# --- Get User Selection ---
# Parameter check: If parameter is provided and valid, skip the prompt.
if ($Selection) {
    if ($Selection -in '1','2','3') {
        Write-Host "Auto-selection active: Option $Selection" -ForegroundColor Green
        $option = $Selection
    } else {
        Write-Warning "Invalid parameter '$Selection'. Switching to interactive mode."
        $Selection = $null # Geçersizse manuel moda düş
    }
}

# If option is not set (either no parameter or invalid parameter), ask manually
if (-not $option) {
    Write-Host "Please select an option:" -ForegroundColor DarkCyan
    Write-Host "1 - Standard" -ForegroundColor Cyan
    Write-Host "2 - Gokhan >_" -ForegroundColor Cyan
    Write-Host "3 - Full (All apps will be removed; only the Microsoft Store will remain)" -ForegroundColor Cyan
    Write-Host "Note: The list of apps to be removed will be displayed below based on your selection." -ForegroundColor DarkGray
    $option = Read-Host "Your selection (1/2/3)"
}

if ($option -notin '1','2','3') {
    Write-Host "Invalid selection. Script is terminating." -ForegroundColor Red
    exit
}

# --- App lists by option ---

# 1 - Standard
$appsToRemove_1 = @(
    "Microsoft.SkypeApp*", # Skype
    "Microsoft.BingNews*", # Bing News
    "Microsoft.GetHelp*", # Get Help
    "Microsoft.GetStarted*", # Get Started
    "Microsoft.MicrosoftSolitaireCollection*", # Microsoft Solitaire Collection
    "Microsoft.LinkedIn*", # LinkedIn
    "Microsoft.MixedReality.Portal*", # Mixed Reality Portal
    "Microsoft.WindowsFeedbackHub*", # Feedback Hub
    "Microsoft.People*", # People
    "Microsoft.Maps*", # Maps
    "SpotifyAB.SpotifyMusic_zpdnekdrzrea0", # Spotify
    "Microsoft.549981C3F5F10_8wekyb3d8bbwe", # News and Interests
    "Microsoft.BingFinance_8wekyb3d8bbwe", # Bing Finance
    "Microsoft.BingSports_8wekyb3d8bbwe", # Bing Sports
    "Disney.37853FC22B2CE_6rarf9sa4v8jt", # Disney+
    "Microsoft.Wallet_8wekyb3d8bbwe", # Wallet
    "Microsoft.Office.OneNote_8wekyb3d8bbwe", # OneNote
    "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe", # Office Hub
    "Microsoft.3DBuilder_8wekyb3d8bbwe", # 3D Builder
    "Microsoft.BingWeather_8wekyb3d8bbwe", # Bing Weather
    "Microsoft.WindowsAlarms_8wekyb3d8bbwe", # Alarms & Clock
    "Microsoft.WindowsMaps_8wekyb3d8bbwe", # Maps
    "Microsoft.WindowsPhone_8wekyb3d8bbwe", # Your Phone
    "Microsoft.ConnectivityStore_8wekyb3d8bbwe", # Connectivity Store
    "Microsoft.Messaging_8wekyb3d8bbwe", # Messaging
    "Microsoft.Office.Sway_8wekyb3d8bbwe", # Sway
    "Microsoft.OneConnect_8wekyb3d8bbwe", # OneConnect
    "Clipchamp.Clipchamp_yxz26nhyzhsrt", # Clipchamp
    "Microsoft.Todos_8wekyb3d8bbwe", # Microsoft To Do
    "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe", # Quick Assist
    "Microsoft.DevHome", # Dev Home
    "9NBLGGH5R558", # Microsoft To Do
    "9NXQXXLFST89", # Power Automate
    "MSIX\Microsoft.BingNews_4.55.62231.0_x64__8wekyb3d8bbwe", # Bing News MSIX
    "9NHT9RB2F4HD", # Family Safety
    "MSIX\Microsoft.Microsoft3DViewer_7.2502.5012.0_x64__8wekyb3d8bbwe" # 3D Viewer MSIX
)
# 2 - Gokhan >_
$appsToRemove_2 = @(
    "Microsoft.SkypeApp*", # Skype
    "Microsoft.BingNews*", # Bing News
    "Microsoft.GetHelp*", # Get Help
    "Microsoft.GetStarted*", # Get Started
    "Microsoft.MicrosoftSolitaireCollection*", # Microsoft Solitaire Collection
    "Microsoft.LinkedIn*", # LinkedIn
    "Microsoft.YourPhone*", # Your Phone
    "Microsoft.MixedReality.Portal*", # Mixed Reality Portal
    "Microsoft.WindowsFeedbackHub*", # Feedback Hub
    "Microsoft.People*", # People
    "Microsoft.Maps*", # Maps
    "SpotifyAB.SpotifyMusic_zpdnekdrzrea0", # Spotify
    "Microsoft.549981C3F5F10_8wekyb3d8bbwe", # News and Interests
    "Microsoft.BingFinance_8wekyb3d8bbwe", # Bing Finance
    "Microsoft.BingSports_8wekyb3d8bbwe", # Bing Sports
    "Disney.37853FC22B2CE_6rarf9sa4v8jt", # Disney+
    "Microsoft.Wallet_8wekyb3d8bbwe", # Wallet
    "Microsoft.Office.OneNote_8wekyb3d8bbwe", # OneNote
    "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe", # Office Hub
    "Microsoft.3DBuilder_8wekyb3d8bbwe", # 3D Builder
    "Microsoft.BingWeather_8wekyb3d8bbwe", # Bing Weather
    "Microsoft.ZuneMusic_8wekyb3d8bbwe", # Groove Music
    "Microsoft.ZuneVideo_8wekyb3d8bbwe", # Movies & TV
    "Microsoft.WindowsAlarms_8wekyb3d8bbwe", # Alarms & Clock
    "Microsoft.WindowsMaps_8wekyb3d8bbwe", # Maps
    "Microsoft.WindowsPhone_8wekyb3d8bbwe", # Your Phone
    "Microsoft.XboxIdentityProvider_8wekyb3d8bbwe", # Xbox Identity Provider
    "Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe", # Xbox Speech to Text Overlay
    "Microsoft.ConnectivityStore_8wekyb3d8bbwe", # Connectivity Store
    "Microsoft.Messaging_8wekyb3d8bbwe", # Messaging
    "Microsoft.Office.Sway_8wekyb3d8bbwe", # Sway
    "Microsoft.OneConnect_8wekyb3d8bbwe", # OneConnect
    "Microsoft.XboxApp_8wekyb3d8bbwe", # Xbox App
    "Clipchamp.Clipchamp_yxz26nhyzhsrt", # Clipchamp
    "Microsoft.Todos_8wekyb3d8bbwe", # Microsoft To Do
    "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe", # Quick Assist
    "Microsoft.XboxGamingOverlay_8wekyb3d8bbwe", # Xbox Gaming Overlay
    "Microsoft.XboxGameOverlay_8wekyb3d8bbwe", # Xbox Game Overlay
    "Microsoft.Xbox.TCUI_8wekyb3d8bbwe", # Xbox TCUI
    "9P1J8S7CCWWT", # Xbox Game Pass
    "9NCBCSZSJRSB", # Xbox Accessories
    "Microsoft.DevHome", # Dev Home
    "9NBLGGH5R558", # Microsoft To Do
    "9NXQXXLFST89", # Power Automate 
    "MSIX\Microsoft.BingNews_4.55.62231.0_x64__8wekyb3d8bbwe", # Bing News MSIX
    "9NHT9RB2F4HD", # Family Safety
    "MSIX\Microsoft.Microsoft3DViewer_7.2502.5012.0_x64__8wekyb3d8bbwe", # 3D Viewer MSIX
    "Microsoft.BingSearch*", # Bing Search
    "Microsoft.GamingApp*", # Xbox App (GamingApp)
    "Microsoft.PowerAutomateDesktop*", # Power Automate Desktop
    "Microsoft.Windows.DevHome*", # Dev Home
    "MSTeams*", # Microsoft Teams
    "Microsoft.OutlookForWindows*", # Outlook for Windows
    "MicrosoftWindows.CrossDevice*" # Cross Device Experience Host
)

# 3 - Full
$appsToRemove_3 = @(
    "Microsoft.SkypeApp*", # Skype
    "Microsoft.BingNews*", # Bing News
    "Microsoft.GetHelp*", # Get Help
    "Microsoft.GetStarted*", # Get Started
    "Microsoft.MicrosoftSolitaireCollection*", # Microsoft Solitaire Collection
    "Microsoft.LinkedIn*", # LinkedIn
    "Microsoft.YourPhone*", # Your Phone
    "Microsoft.MixedReality.Portal*", # Mixed Reality Portal
    "Microsoft.WindowsFeedbackHub*", # Feedback Hub
    "Microsoft.People*", # People
    "Microsoft.Maps*", # Maps
    "SpotifyAB.SpotifyMusic_zpdnekdrzrea0", # Spotify
    "Microsoft.549981C3F5F10_8wekyb3d8bbwe", # News and Interests
    "Microsoft.BingFinance_8wekyb3d8bbwe", # Bing Finance
    "Microsoft.BingSports_8wekyb3d8bbwe", # Bing Sports
    "Disney.37853FC22B2CE_6rarf9sa4v8jt", # Disney+
    "Microsoft.Wallet_8wekyb3d8bbwe", # Wallet
    "Microsoft.Office.OneNote_8wekyb3d8bbwe", # OneNote
    "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe", # Office Hub
    "Microsoft.3DBuilder_8wekyb3d8bbwe", # 3D Builder
    "Microsoft.BingWeather_8wekyb3d8bbwe", # Bing Weather
    "Microsoft.ZuneMusic_8wekyb3d8bbwe", # Groove Music
    "Microsoft.ZuneVideo_8wekyb3d8bbwe", # Movies & TV
    "Microsoft.WindowsAlarms_8wekyb3d8bbwe", # Alarms & Clock
    "Microsoft.WindowsCamera_8wekyb3d8bbwe", # Camera
    "Microsoft.WindowsMaps_8wekyb3d8bbwe", # Maps
    "Microsoft.WindowsPhone_8wekyb3d8bbwe", # Your Phone
    "Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe", # Sound Recorder
    "Microsoft.XboxIdentityProvider_8wekyb3d8bbwe", # Xbox Identity Provider
    "Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe", # Xbox Speech to Text Overlay
    "Microsoft.ConnectivityStore_8wekyb3d8bbwe", # Connectivity Store
    "Microsoft.Messaging_8wekyb3d8bbwe", # Messaging
    "Microsoft.Office.Sway_8wekyb3d8bbwe", # Sway
    "Microsoft.OneConnect_8wekyb3d8bbwe", # OneConnect
    "Microsoft.XboxApp_8wekyb3d8bbwe", # Xbox App
    "Clipchamp.Clipchamp_yxz26nhyzhsrt", # Clipchamp
    "Microsoft.Todos_8wekyb3d8bbwe", # Microsoft To Do
    "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe", # Quick Assist
    "Microsoft.XboxGamingOverlay_8wekyb3d8bbwe", # Xbox Gaming Overlay
    "Microsoft.XboxGameOverlay_8wekyb3d8bbwe", # Xbox Game Overlay
    "Microsoft.Xbox.TCUI_8wekyb3d8bbwe", # Xbox TCUI
    "9P1J8S7CCWWT", # Xbox Game Pass
    "9NCBCSZSJRSB", # Xbox Accessories
    "Microsoft.DevHome", # Dev Home
    "9NBLGGH5R558", # Microsoft To Do
    "9NXQXXLFST89", # Power Automate
    "MSIX\Microsoft.BingNews_4.55.62231.0_x64__8wekyb3d8bbwe", # Bing News MSIX
    "9NHT9RB2F4HD", # Family Safety
    "MSIX\Microsoft.Microsoft3DViewer_7.2502.5012.0_x64__8wekyb3d8bbwe", # 3D Viewer MSIX
    # Extra apps
    "Microsoft.WindowsCalculator*", # Calculator
    "Microsoft.Paint*", # Paint
    "Microsoft.Windows.Photos*", # Photos
    "Microsoft.WindowsCommunicationsApps*", # Mail and Calendar
    "Microsoft.MicrosoftStickyNotes*", # Sticky Notes
    "Microsoft.ScreenSketch*", # Snipping Tool
    "Microsoft.ZuneMusic_8wekyb3d8bbwe", # Groove Music
    "Microsoft.ZuneVideo_8wekyb3d8bbwe", # Movies & TV
    "Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe", # Sound Recorder
    "Microsoft.WindowsCamera_8wekyb3d8bbwe", # Camera
    "Microsoft.WindowsAlarms_8wekyb3d8bbwe", # Alarms & Clock
    "Microsoft.WindowsMediaPlayer*", # Windows Media Player
    "Microsoft.BingSearch*", # Bing Search
    "Microsoft.GamingApp*", # Xbox App (GamingApp)
    "Microsoft.PowerAutomateDesktop*", # Power Automate Desktop
    "Microsoft.Windows.DevHome*", # Dev Home
    "MSTeams*", # Microsoft Teams
    "Microsoft.OutlookForWindows*", # Outlook for Windows
    "Microsoft.BingSearch*", # Bing Search
    "Microsoft.GamingApp*", # Xbox App (GamingApp)
    "Microsoft.PowerAutomateDesktop*", # Power Automate Desktop
    "Microsoft.Windows.DevHome*", # Dev Home
    "MSTeams*", # Microsoft Teams
    "Microsoft.OutlookForWindows*", # Outlook for Windows
    "MicrosoftWindows.CrossDevice*", # Cross Device Experience Host
    "Microsoft.BingSearch*", # Bing Search
    "Microsoft.GamingApp*", # Xbox App (GamingApp)
    "Microsoft.PowerAutomateDesktop*", # Power Automate Desktop
    "Microsoft.Windows.DevHome*", # Dev Home
    "MSTeams*", # Microsoft Teams
    "Microsoft.OutlookForWindows*", # Outlook for Windows
    "MicrosoftWindows.CrossDevice*" # Cross Device Experience Host
)

switch ($option) {
    '1' { $appsToRemove = $appsToRemove_1 }
    '2' { $appsToRemove = $appsToRemove_2 }
    '3' { $appsToRemove = $appsToRemove_3 }
}

Write-Host "`n===============================" -ForegroundColor DarkCyan
Write-Host "The following apps will be removed:" -ForegroundColor Red
$displayNames = Get-AppDisplayNames -AppList $appsToRemove
$appsInline = $displayNames -join ", "
Write-Host $appsInline -ForegroundColor White
Write-Host "===============================" -ForegroundColor DarkCyan

function Remove-AppXPackagesForAllUsers {
    param(
        [string[]]$PackagePatterns
    )

    Write-Host "`n--- Removing AppX packages for all existing users ---`n" -ForegroundColor Blue

    foreach ($pattern in $PackagePatterns) {
        Write-Host "Searching for installed packages matching '$pattern'..." -ForegroundColor Cyan
        $packages = Get-AppxPackage -AllUsers | Where-Object { $_.PackageFamilyName -like $pattern }

        if ($packages) {
            foreach ($package in $packages) {
                try {
                    Write-Host "Attempting to remove $($package.Name) (PackageFamilyName: $($package.PackageFamilyName)) for all users..." -ForegroundColor Cyan
                    Remove-AppxPackage -Package $package.PackageFullName -AllUsers -ErrorAction Stop
                    Write-Host "Successfully removed $($package.Name) for all users." -ForegroundColor Green
                }
                catch {
                    Write-Warning "Failed to remove $($package.Name) for all users. Error: $($_.Exception.Message)"
                }
            }
        } else {
            Write-Host "No installed packages found matching '$pattern' for existing users." -ForegroundColor Green
        }
    }
} 
function Remove-AppXProvisionedPackages {
    param(
        [string[]]$PackagePatterns
    )

    Write-Host "`n--- Removing AppX provisioned packages (for new users) ---`n" -ForegroundColor Blue

    foreach ($pattern in $PackagePatterns) {
        Write-Host "Searching for provisioned packages matching '$pattern'..." -ForegroundColor Cyan
        # Provisioned package names often include version, so the wildcard is crucial.
        $provisionedPackages = Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -like $pattern }

        if ($provisionedPackages) {
            foreach ($provPackage in $provisionedPackages) {
                try {
                    Write-Host "Attempting to remove provisioned package $($provPackage.PackageName)..." -ForegroundColor Cyan
                    Remove-AppxProvisionedPackage -Online -PackageName $provPackage.PackageName -ErrorAction Stop
                    Write-Host "Successfully removed provisioned package $($provPackage.PackageName)." -ForegroundColor Green
                }
                catch {
                    Write-Warning "Failed to remove provisioned package $($provPackage.PackageName). Error: $($_.Exception.Message)"
                }
            }
        } else {
            Write-Host "No provisioned packages found matching '$pattern'." -ForegroundColor Green
        }
    }
}

Write-Host "This script will attempt to remove the specified AppX packages for all existing users and prevent them from being installed for new users." -ForegroundColor Cyan

# Onay kısmı: Parametre geldiyse otomatik onayla
if ($Selection) {
    Write-Host "Auto-confirming due to parameter..." -ForegroundColor Green
    $response = 'y'
} else {
    $response = Read-Host "Do you want to continue? (y/n)"
}

if ($response -ne 'y' -and $response -ne 'Y') {
    Write-Host "Operation cancelled. Exiting in 5s..." -ForegroundColor Red
    timeout /t 5 > $null
    exit
}

switch ($option) {
    '2' {
        $oneDriveInstalled = winget list --id Microsoft.OneDrive -e | Select-String "Microsoft.OneDrive"
        if ($oneDriveInstalled) {
            Write-Host "Removing OneDrive..." -ForegroundColor Cyan
            try {
                winget uninstall --id Microsoft.OneDrive -e --silent
                Write-Host "OneDrive successfully removed." -ForegroundColor Green
            } catch {
                Write-Warning "An error occurred while removing OneDrive: $($_.Exception.Message)"
            }
        }
    }
    '3' {
        $oneDriveInstalled = winget list --id Microsoft.OneDrive -e | Select-String "Microsoft.OneDrive"
        if ($oneDriveInstalled) {
            Write-Host "Removing OneDrive..." -ForegroundColor Cyan
            try {
                winget uninstall --id Microsoft.OneDrive -e --silent
                Write-Host "OneDrive successfully removed." -ForegroundColor Green
            } catch {
                Write-Warning "An error occurred while removing OneDrive: $($_.Exception.Message)"
            }
        }
    }
}

# Step 1: Remove AppX packages for all existing users
Remove-AppXPackagesForAllUsers -PackagePatterns $appsToRemove

# Step 2: Remove AppX provisioned packages for new users
Remove-AppXProvisionedPackages -PackagePatterns $appsToRemove

Write-Host "`n--- Script execution completed ---" -ForegroundColor Green

# If run with parameter, exit without waiting for key press; otherwise wait.
if (-not $Selection) {
    Read-Host "Press any key to exit..."
}