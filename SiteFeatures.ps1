# Load SharePoint PowerShell Snapin
Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

# Specify the URL of the SharePoint site
$siteUrl = "http://YourSiteUrl"

# Connect to the SharePoint site
$site = Get-SPSite $siteUrl

# Get the SharePoint web
$web = $site.RootWeb

# Get the feature by its display name
$featureDisplayName = "Site Pages"
$feature = Get-SPFeature | Where-Object { $_.DisplayName -eq $featureDisplayName }

# Check if the feature is activated at the site level
if ($web.Features[$feature.Id]) {
    Write-Host "The '$featureDisplayName' feature is activated on the site."
} else {
    Write-Host "The '$featureDisplayName' feature is not activated on the site."
}

# Dispose SharePoint objects
$web.Dispose()
$site.Dispose()
