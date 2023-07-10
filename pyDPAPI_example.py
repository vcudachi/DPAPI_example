# https://github.com/vcudachi/DPAPI_example
from pyDPAPI_protect_unprotect import pyDPAPI

ps = pyDPAPI.protect("The String i want to be secure")
print('')
print(ps)
print('')
print(pyDPAPI.unprotect(ps))
print('')