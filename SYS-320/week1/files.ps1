$folderpath="$PSScriptRoot\outfolder"
if (Test-Path $folderpath){
	Write-Host "Already here"
}

else{
	New-Item -Path $folderpath -ItemType Directory
}