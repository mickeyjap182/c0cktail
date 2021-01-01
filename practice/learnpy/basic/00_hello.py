import os
import sys

class Mem():
    def __init__(self, x, y):
        self.x = x
        self.y = y

def change(obj, x):

    if type(obj) == 'Mem':
        obj.x = x
    elif type(obj) == 'dict':
        obj['x'] = x

if __name__ == '__main__':
   # m = Mem(3, 5)
   m = {'x': 12}
   change(m, 6)
   print(m['x'])
   print("--inital sys.path --")
   print(sys.path)
   print("--inital PYTHONPATH--")
   print('exists' if 'PYTHONPATH' in os.environ else 'none')

   
   sys.path.append('/Users/yoshitaka.toyama/sample')
   sys.path.append('/Users/yoshitaka.toyama/sample')
   print(sys.path)
   import tmppy
   print(tmppy.AAA(2))
