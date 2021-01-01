import sys
from datetime import datetime, timedelta

class StopWatch():
    def __init__(self):
        '''  stop watch. '''
        self.timer = timedelta(microseconds=-1)
        self.start = str(self.timer.seconds) + ':' +str(self.timer.microseconds)

    def elapsed_sec(self):
        print(self.start)
        return str(self.timer.seconds) + ':' +str(self.timer.microseconds)
