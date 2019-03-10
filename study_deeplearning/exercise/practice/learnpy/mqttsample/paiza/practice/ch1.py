import numpy as np
import datetime as d
import matplotlib.pyplot as plt

# numpyによるランダムデータ生成(乱数は)
cur = d.datetime.now()
seed = cur.microsecond
seed_b = int(str(seed) + str(cur.strftime('%s'))[:7:-1])
print(seed)
print(seed_b)
np.random.seed(seed_b)
data_a = np.random.randint(1, 100, 10)
print(data_a)

# numpyによるランダムデータ生成(乱数は)
data_b = np.array([1, 4, 4, 5, 6, 9, 22, 13, 8, 14])
plt.plot(data_a, data_b)

# tester 'sha1:8507928cd7e9:f47616e64a04e40872b75ab728c49300fea77819'
