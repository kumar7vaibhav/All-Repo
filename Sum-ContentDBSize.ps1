Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

# Function to convert bytes to human-readable format
function ConvertTo-HumanReadable {
    param([double]$size)
    $units = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
    $index = 0
    while ($size -ge 1KB -and $index -lt $units.Count) {
        $size = $size / 1KB
        $index++
    }
    "{0:N2} {1}" -f $size, $units[$index]
}

# Get SharePoint Content Databases
$contentDatabases = Get-SPContentDatabase

# Loop through each content database and calculate size
foreach ($contentDB in $contentDatabases) {
    $dbName = $contentDB.Name
    $dbSize = $contentDB.DiskSizeRequired
    $humanReadableSize = ConvertTo-HumanReadable -size $dbSize
    Write-Host "Content Database: $dbName"
    Write-Host "Size: $humanReadableSize"
}
