import sys
import math
import random
import openpyxl
import numpy as np

# def depth(x, y, index) :
#     return x * y
# 初期処理
li = list(map(lambda x: int(x), sys.argv[1:]))
count = len(li)

print("==Python==")
print(li)

nd_arr = np.matrix([[1,  2],[3,   5]])
print(nd_arr.prod())
print(nd_arr.prod(axis=0))
print(nd_arr.prod(axis=1))

print("==算術平均、相加平均==")
arithmetic_avg = sum(li) / count
print(arithmetic_avg) # 配列全体を平均化?

print("==中央値==")
med = (len(li) / 2) if (len(li) % 2 == 0) else ((len(li) + 1) / 2)
print(len(li))
print(med)
sorted_li = li.copy()
sorted_li.sort()
print(sorted_li)
print(sorted_li[int(med)]) # 配列全体を平均化?

# av = mean(li)
# print(av) # 数値型で結果を
#
print("==相乗平均、幾何平均(値の積の要素数根)==")
# print( [x for x in li ] ** (1 / count))
print(np.prod(np.asarray(li)) ** (1 / count))
#
# print("==不偏標準偏差==")
# print(sd(li))
#
print("==偏差(n、各要素が算術平均からどのくらい離れているか)==")
va_n = list(map(lambda x: round(x - arithmetic_avg, 4), li))
print(va_n)

print("==分散==")
dispersion_base = list(map(lambda x: round((x - arithmetic_avg) ** 2, 4), li))
print(dispersion_base)
dispersion = sum(dispersion_base) / (len(li) - 1)
print(dispersion)

print("==標準偏差(偏差べき乗配列の総和の二乗値(分散)とその平方根(標準偏差))==")
print("===n-1の平方根を利用した標準偏差(統計学版)")
standard_deviation = math.sqrt(dispersion)
print(standard_deviation)

print("===nで割った標準偏差(Excel版)")
print(sum(dispersion_base) / len(li))


print("==標準化得点...外れ値(データ分布の特性が他の値と違う値)を判断する==")
abnormal_value = list(map(lambda x: round((x - arithmetic_avg) / standard_deviation , 4), li))
print(abnormal_value)

print("==ベルヌーイ試行(排反事象による試行(コインの裏表など))、ベル型分布(平均値の分布が教会のベルのように分布)==")


print("==独立(試行に依存しない)、条件付き（ある現象が他の現象に依存する、例2枚のコインを投げた時の表、裏のの組み合わせ）==")

r1_rets = []
r2_rets = []
rets = []
part = {}
length = 100
for i in range(length):
    r1_rets.append(random.randint(0, 1))
    r2_rets.append(random.randint(0, 1))
    if r1_rets[i] == r2_rets[i]:
        rets.append("両方表" if r1_rets[i] == 1 else "両方裏")
    else :
        rets.append("1枚目表、2枚目裏" if r1_rets[i] == 1 else "1枚目裏、2枚目表")
    percentage = round((100 / length), 3)
    part[rets[i]] = part[rets[i]] + percentage if rets[i] in part else percentage

print(part)

#


# dp_n = sapply(li, function(x) { return ((x - av) ^ 2) } )
# print(dp_n)
# dp = sum(dp_n) / (length(dp_n) - 1)
# print("===分散")
# print(dp)
# print("===n-1の平方根を利用した標準偏差(統計学版)")
# print(sqrt(dp))
#
#
# print("==クォンタイル点(最小から最大まで中央値を50%として表示)==")
# print(quantile(li)) # クォンタイル点
#
#
# print("==中央値==")
# print(median(li))
#
#
# print("==5数要約==")
# print(fivenum(li))
#
# print("==4分位偏差==")
# print(IQR(li))
#
# print("==範囲==")
# print(range(li))
#
# print("==最大、最小、平均、中央値 ==")
# print(summary(li))
#
# print("==合計値の自然対数（基数2）==")
# print(log2(sum(li)))
