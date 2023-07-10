# https://github.com/vcudachi/DPAPI_example
. .\psDPAPI_Protect_Unprotect.ps1
Write-Host ''
Write-Host ($ps = Protect-psDPAPI -string 'The String i want to be secure')
Write-Host ''
Write-Host (Unprotect-psDPAPI -protectedstring $ps)
Write-Host ''