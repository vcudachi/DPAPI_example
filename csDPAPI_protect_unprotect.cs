// https://github.com/vcudachi/DPAPI_example
// .NET Framework 4.8: add reference "System.Security.dll"
// .NET 6: add nuget package "System.Security.Cryptography.ProtectedData"

using System;
using System.Text;

namespace vcudachi
{
    public static class csDPAPI
    {
        private static byte[] StringToByteArray(String hex)
        {
            int NumberChars = hex.Length;
            byte[] bytes = new byte[NumberChars / 2];
            for (int i = 0; i < NumberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        public static String protect(String String)
        {
            byte[] string_ba = Encoding.Unicode.GetBytes(String);
            byte[] protectedstring_ba = System.Security.Cryptography.ProtectedData.Protect(string_ba, null, System.Security.Cryptography.DataProtectionScope.CurrentUser);
            String protectedstring = BitConverter.ToString(protectedstring_ba).Replace("-", "");
            return protectedstring;
        }

        public static String unprotect(String protectedstring)
        {
            byte[] protectedstring_ba = csDPAPI.StringToByteArray(protectedstring);
            byte[] string_ba = System.Security.Cryptography.ProtectedData.Unprotect(protectedstring_ba, null, System.Security.Cryptography.DataProtectionScope.CurrentUser);
            String String = Encoding.Unicode.GetString(string_ba);
            return String;
        }
    }
}