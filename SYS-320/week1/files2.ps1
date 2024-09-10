$files = Get-ChildItem -Path $PSScriptRoot\outfolder "*.csv"
$folderpath="$PSScriptRoot\outfolder"


$files | Rename-Item -NewName { $_.Name -replace "\.csv", ".log" }
ls outfolder "*.log"