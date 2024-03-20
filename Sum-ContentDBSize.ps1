# Import SQL Server module
Import-Module SQLPS -DisableNameChecking

# Set SQL Server instance name
$SQLInstance = "YourSQLServerInstance"

# Connect to SQL Server
$SQLConnection = New-Object System.Data.SqlClient.SqlConnection
$SQLConnection.ConnectionString = "Server=$SQLInstance;Database=master;Integrated Security=True"
$SQLConnection.Open()

# Get SharePoint content databases
$SQLCommand = $SQLConnection.CreateCommand()
$SQLCommand.CommandText = "SELECT name FROM sys.databases WHERE name LIKE 'YourSPContentDBPrefix%'"
$ContentDatabases = $SQLCommand.ExecuteReader()

# Loop through each content database and calculate size
while ($ContentDatabases.Read()) {
    $ContentDBName = $ContentDatabases["name"]
    
    $SQLCommand.CommandText = "SELECT SUM(size) * 8 / 1024 AS SizeMB FROM sys.master_files WHERE database_id = DB_ID('$ContentDBName')"
    $DBSize = $SQLCommand.ExecuteScalar()
    
    Write-Host "Database: $ContentDBName - Size: $DBSize MB"
}

# Close SQL connection
$SQLConnection.Close()
