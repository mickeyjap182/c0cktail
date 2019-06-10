import numpy as np

class Report:
    def mid(self, x) :
        if not hasattr(self, 'x') or self.x < x :
            self.x = x
            return self.x
        else :
            return x
score = [90, 46, 68, 89, 90]
a = Report()
m = list(map(a.mid, score))
print(m)



score2 = [45, 80, 33, 75, 66]

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


# 全ての要素が条件を満たすか
print(all(s < 91 for s in score ))
print(all(s < 90 for s in score ))

dic_a = {'a1':"aaa", 'a2':"sss"}
dic_b = {'b1':"bbb", 'b2':"sbbss"}
