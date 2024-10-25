if (Get-Process -Name "chrome" -ErrorAction SilentlyContinue) {
# SilentlyContinue continues the script without any error message in the case that Chrome is not open.
echo "Stopping Google Chrome"
Stop-Process -Name "chrome"
}
else {
echo "Starting Google Chrome"
Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://champlain.edu"
}