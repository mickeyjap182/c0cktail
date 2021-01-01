import sys
import os
from unittest import TestLoader
from unittest import TextTestRunner

class Runner():

    def __init__(self, path, pattern, top_level_dir):
        self.path = path
        self.pattern = pattern
        self.top_level_dir = top_level_dir

    def run(self):
        tests = TestLoader().discover(self.path, pattern=self.pattern, top_level_dir=self.top_level_dir)
        TextTestRunner().run(tests)


if __name__ == 'main':
    path = os.path.dirname(__file__)
    r = Runner(path, '*tests.py', None)
    r.run()