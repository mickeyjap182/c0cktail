
class Para():

    @staticmethod
    def plus_minus(a, b):

        return (a + b), (a - b)


targets = [(2,3),(4,5),(6,7)]

ret = [Para.plus_minus(n, m) for n, m in targets]

print(ret)
