import unittest

from deeplerning.perceptron import AND

class PerceptronTest(unittest.TestCase):
    def testSample(self):
        message = "deep learning"
        # Expected value is equals running code?
        self.assertEqual(message.split(), ['deep', 'learning'])

        # Does Raise TypeError?
        with self.assertRaises(TypeError):
            message.split(2)

    def testAND(self):
        self.assertEqual(AND(0.6, 0.6), 0)
        self.assertEqual(AND(0.7, 0.7), 0)

        self.assertEqual(AND(0.8, 0.8), 1)
