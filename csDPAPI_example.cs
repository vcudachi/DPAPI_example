// https://github.com/vcudachi/DPAPI_example

using System;

namespace vcudachi
{
    internal class Program
    {
        static void Main(string[] args)
        {
            String ps = vcudachi.csDPAPI.protect("The String i want to be secure");
            Console.WriteLine("");
            Console.WriteLine(ps);
            Console.WriteLine("");
            Console.WriteLine(vcudachi.csDPAPI.unprotect(ps));
            Console.WriteLine("");
        }
    }
}
