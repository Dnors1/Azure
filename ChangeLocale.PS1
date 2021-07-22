# Script to define regional settings on Azure Virtual Machines deployed from the market place
#
######################################

#variables
$regionalsettingsURL = "https://raw.githubusercontent.com/Dnors1/Azure/main/GBRegion.XML"
$RegionalSettings = "C:\Temp\GBRegion.xml"


#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)
#($regionalsettingsURL)

# Set Locale, language etc. 
#& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages. Not necessarily needed.
Set-WinSystemLocale en-GB
Set-WinUserLanguageList -LanguageList en-GB -Force
Set-Culture -CultureInfo en-GB
Set-WinHomeLocation -GeoId 242
Set-TimeZone -Name "GMT Standard Time"

# Log off/on to apply to user. Restart to apply to System.
# Restart-Computer