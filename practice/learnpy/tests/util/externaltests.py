import unittest
import sys
import os
path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
# sys.path.append("../../../learnpy")
#
print(path)
sys.path.append(path)
# print(os.environ.get("PYTHONPATH"))
from utils.external import CallLib

class CallLibTest(unittest.TestCase):

    def testAdd(self):
        # print(os.path.abspath(__file__))
        fib = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))), 'bin', 'external', "sample", "fibonacci.so")
        print(fib)
        CallLib.add(fib)
        ret = CallLib.call(fib, 'fibonacci', 5)

        print(ret)
        self.assertTrue(True)



if __name__ == "__main__" :
    print(CallLibTest.testAdd())



