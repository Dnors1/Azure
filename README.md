# Azure Windows Images Default To en-US
By default every Windows virtual machine deployed in Azure from the marketplace will be using US regional settings. 

Timezone, Time Format, Currency and keyboard will all be in EN-US. 

I have been tasked with changing this on customer Azure environments. 

I have created an XML for English Great Britain for all to access. 

If you have any further XML requirements please feel free to post them and I will add them to the repository. 

As a one off change you can use the following - 

Set-WinSystemLocale en-GB
Set-WinUserLanguageList -LanguageList en-GB -Force
Set-Culture -CultureInfo en-GB
Set-WinHomeLocation -GeoId 242
Set-TimeZone -Name "GMT Standard Time"

For each specific click each link and find accordingly 

GeoIDs - 
https://docs.microsoft.com/en-us/windows/win32/intl/table-of-geographical-locations

Keyboard language IDs - Drop the brackets on the code when populating XML as per GBRegion.XML
https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-input-locales-for-windows-language-packs

Time Zones - All are bunched up in the block 
https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.management.monitor.models.timewindow.timezone?view=azure-dotnet

If you already have said time zone 
PowerShell:
get-timezone | Select Id



HOW TO APPLY TO VMs automatically

Login to Azure portal - Azure.portal.com
Open the menu blade
Virtual machines
Click a machine 
Under settings go to extensions
Click add
Click Custom Script Extension
Click create
Browse to your local copy of the ChangeLocale.PS1
