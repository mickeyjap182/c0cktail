import numpy as np

class Report:
    """ ソート用 """
    def __init__(self):
        self.i = 0
        self.history = []
    def mid(self, x) :
        self.history.append(x)
        if not hasattr(self, 'x') or self.x < x :
            self.x = x
            return self.x
        else :
            return x
    def __iter__(self) :
        """ イテレータへのキャスト時(for やiter())の動作 """
        self.i = 0
        return iter(self.history)
    def __next__(self) :
        """ nextのイテレーションで取り出す操作 """
        self.i += 1
        if len(self.history) <= (self.i - 1) :
            # 終わるときはStopIterationを投げる
            raise StopIteration

        return self.history[self.i-1]
        # return self.history[self.i-1] if len(self.history) > (self.i - 1) else None

score = [90, 46, 68, 89, 90]
a = Report()
# リストの各値へ関数をかける
m = list(map(a.mid, score))
print(m)
score2 = [45, 80, 33, 75, 66]

### 組み込み関数 ###
print("==組み込み関数おさらい==")
print("abs(-10):{0}".format(abs(-10)))
print("min(-5, 0, 5):{0}".format(min(-5, 0, 5)))
print("hex(13):{0}".format(hex(13)))
print("next(iter([3,5])):{0}".format(next(iter([3,5]))))
print("next(a,'none'):{0}".format(next(a,"none")))
print("(0, 10, 1).stop:{0} ...range()やリスト操作内部で使用slice".format(slice(0, 10, 1).stop)) # s.start, s.stop, s.stepが取れる
print("divmod(10, 6):{0} ...divとmodの結果両方取得".format(divmod(10, 6)))
print("exec('print(\"The sum of 5 and 10 is\", (5+10))'):",end="")
exec('print("The sum of 5 and 10 is", (5+10))')
print("id(a):{0} ...有効期間が重ならない限り一意のオブジェクト識別子".format(id(a)))
print("object(a):{0} ...有効期間が重ならない限り一意のオブジェクト識別子".format(id(a)))
print("==help(some)...引数オブジェクトのヘルプを表示==")
print("==dir(some)...オブジェクトがもつオブジェクトを表示==")
# ソート関数
data = [{'id':"abc",'name':"citras",},{'id':"bbm",'name':"apple",},{'id':"ccd",'name':"banana",},]
print(sorted(data, key=lambda x: x['id']))
# all()	dir()	hex()	next()	slice()
# any()	divmod()	id()	object()	sorted()

# ascii()	enumerate()	input()	oct()	staticmethod()
# bin()	eval()	int()	open()	str()
# bool()	exec()	isinstance()	ord()	sum()
# bytearray()	filter()	issubclass()	pow()	super()
# bytes()	float()	iter()	print()	tuple()
# callable()	format()	len()	property()	type()
# chr()	frozenset()	list()	range()	vars()
# classmethod()	getattr()	locals()	repr()	zip()
# compile()	globals()	map()	reversed()	__import__()
# complex()	hasattr()	max()	round()
# delattr()	hash()	memoryview()	set()
print("==others:help()==")

# 短い方へ合わせて、同時に複数のリストを展開
for a, b in zip(score2, score):
    print(a)
    print(b)

print([i for i in score2 if i > 50])
print(list(filter(lambda x: x > 50, score2)))

# 条件にマッチしたもののみ抽出
def find(cond, li, default=None):
    # next でイテレータオブジェクトの次要素読み出し（ない場合はデフォルトを使用）
    return next((l for l in li if cond(l)), default)
print(find(lambda x : x % 10 == 3, score2, default=[]))


# 全ての要素がTrueか
print(all(s < 91 for s in score ))
print(all(s < 90 for s in score ))
# 一つの要素でもTrueか
print(any(s > 90 for s in score ))
print(any(s > 89 for s in score ))

print((s+8 for s in score if s < 70))
print({s + 8 for s in score if s < 70})
print({s + 8 for s in score if s < 70})

dic_a = {'a1':"aaa", 'a2':"sss"}
dic_b = {'b1':"bbb", 'b2':"sbbss"}
