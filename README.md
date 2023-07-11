# DPAPI_example
The main purpose is to show how do decrypt PowerShell secrets, created by "$string | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString", in Python and C#. When -key parameter in ConvertTo-SecureString is ommited, then DPAPI mechanisms may be used to decrypt a secure string in other langauge. This may be useful in mixed-language scenarious.

# Dependencies
- PowerShell: No dependencies
- C#: .NET Framework: No dependencies
- C#: .NET Core: nuget package "System.Security.Cryptography.ProtectedData"
- Python: Python.NET
