import sys
from lib import StopWatch

class Sorter():
    def __init__(self, data:list):
        self.data = data

    def bubble(self):
        ''' return bubble sorted value '''
        ret, tmp = [], self.data
        for i in range(len(self.data)):
            ret = []
            for j, num_j in enumerate(tmp):
                if j == 0 :
                    ret.append(num_j)
                elif ret[j-1] > num_j :
                    ret.append(ret[j-1])
                    ret[j-1] = num_j
                else :
                    ret.append(num_j)
            tmp = ret

        return ret

if __name__ == '__main__' :
    default = [3, 2, 8, 1, 4]
    args = list(map(lambda x: int(x), sys.argv[1:])) if len(sys.argv) > 1 else default
    s = Sorter(args)
    w = StopWatch()
    print(s.bubble())
    import time as t; t.sleep(1)
    print(w.elapsed_sec())
