import numpy as np

#### 1. multipul iteration.
a = [1, 2, 3, 4,5 ]
b = [2, 4, 5, 6, 7, 5]

for x, y in zip(a,b):
   print(x, y)

class Character():
    def

class Worker():
    def __init(self):
        self.type = "worker"


#### 2.functional assort.

class Para():

    @staticmethod
    def plus_minus(a, b):

        return (a + b), (a - b)


targets = [(2,3),(4,5),(6,7)]

ret = [Para.plus_minus(n, m) for n, m in targets]

print(ret)

#### 3. numpy

###
### Numpyの使い方
###
# 要素を繰り返し
print(np.array([[1,2,3] * 3]))
# 配列を繰り返し
print(np.array([[1,2,3]] * 3))
