# https://github.com/vcudachi/DPAPI_example
# pip install pythonnet
# .NET Framework 4.8

import clr
clr.AddReference("System.Security")
from System.Security.Cryptography import ProtectedData
from System.Security.Cryptography import DataProtectionScope
import codecs

class pyDPAPI:
    @staticmethod
    def protect(string: str)->str:
        string_ba = string.encode('utf_16')
        protectedstring_ba = bytes(ProtectedData.Protect(string_ba,[],DataProtectionScope.CurrentUser))
        protectedstring = protectedstring_ba.hex()
        return protectedstring
    
    @staticmethod
    def unprotect(protectedstring: str)->str:
        protectedstring_ba = bytes.fromhex(protectedstring)
        string_ba = bytes(ProtectedData.Unprotect(protectedstring_ba,[],DataProtectionScope.CurrentUser))
        string = string_ba.decode('utf_16')
        return string