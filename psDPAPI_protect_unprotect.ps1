#requires -version 5.1
# https://github.com/vcudachi/DPAPI_example
# Should work in Powershell 7

Function Protect-psDPAPI {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]$string
    )
    process {
        Return ($string | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString)
    }
}

Function Unprotect-psDPAPI {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]$protectedstring
    )
    begin {
        Function Convert-HexToByte {
            [CmdletBinding()]
            [OutputType([byte[]])]
            param(
                [Parameter(Mandatory = $true)] [String]$Value
            )
            $bytes = [byte[]]::new($Value.Length / 2)
            For ($i = 0; $i -lt $Value.Length; $i += 2) {
                $bytes[$i / 2] = [Convert]::ToByte($Value.Substring($i, 2), 16)
            }
            Return , $bytes
        }
    }
    process {
        $protectedstring_ba = Convert-HexToByte -Value $protectedstring
        $string_ba = [System.Security.Cryptography.ProtectedData]::Unprotect($protectedstring_ba, $null, [System.Security.Cryptography.DataProtectionScope]::CurrentUser)
        $string = [System.Text.Encoding]::Unicode.GetString($string_ba)
        Return $string
    }
}