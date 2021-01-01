from ctypes import *

lib = cdll.LoadLibrary("./fibonacci.so")

## arg
lib.fibonacci.argtypes = [c_longlong]
## return
lib.fibonacci.restype = c_longlong
print("fib  %d" % lib.fibonacci(40))