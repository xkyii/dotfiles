# Create
# New-Item –Path $Profile –Type File –Force

# Copy Content to $profile and modify it
# notepad $profile

Remove-Item alias:curl
Remove-Item alias:wget

Set-Alias vi nvim

# home
Function cdxk { Set-Location -Path E:\xkyii\Code\xkdip }
