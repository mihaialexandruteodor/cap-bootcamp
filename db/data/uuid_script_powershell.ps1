# Get the directory of the current script
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition

# Get all CSV files in the script's directory
$csvFiles = Get-ChildItem -Path $scriptDirectory -Filter *.csv

# Check if there are any CSV files
if ($csvFiles.Count -eq 0) {
    Write-Host "No CSV files found in the script's directory: $scriptDirectory"
    exit
}

# Display the list of CSV files for selection
Write-Host "Select a CSV file to process:"
for ($i = 0; $i -lt $csvFiles.Count; $i++) {
    Write-Host "$($i + 1): $($csvFiles[$i].Name)"
}

# Get user selection
$selection = Read-Host "Enter the number of the file you want to process"
if (-not ($selection -as [int]) -or $selection -lt 1 -or $selection -gt $csvFiles.Count) {
    Write-Host "Invalid selection. Exiting."
    exit
}

# Get the selected file
$selectedFile = $csvFiles[$selection - 1].FullName
$outputFile = "$($csvFiles[$selection - 1].DirectoryName)\$($csvFiles[$selection - 1].BaseName)-updated.csv"

# Read the CSV file
$data = Import-Csv -Path $selectedFile

# Replace the ID column with new UUIDs
foreach ($row in $data) {
    $row.ID = [guid]::NewGuid().ToString()
}

# Export the updated data to a new CSV file
$data | Export-Csv -Path $outputFile -NoTypeInformation -Force

Write-Host "Updated file saved to: $outputFile"