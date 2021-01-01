import os
import sys
from audioop import reverse
from pprint import pprint

print("=== begin python zen ==")
import this
print("=== end python zen ==")

# animation
# import antigravity

def rev(*args, **kwargs) :
    print(args)
    return tuple(reversed(args))
a = 10
b = 20
c = 30

print("a={} b={} c={}".format(a, b, c))

a, b, c = rev(a, b, c)
# a, b, c = b, c, a

print("a={} b={} c={}".format(a, b, c))

pprint(rev(a,b,c))
# zip
# itertools
