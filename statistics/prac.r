# 初期処理
args = commandArgs(trailingOnly=TRUE)
li <- array()
for(i in 1:length(args)){
  li[i] <- as.integer(args[i])
}

print("==R==")

print("==算術平均、相加平均==")
print(ave(li)) # 配列全体を平均化?

av = mean(li)
print(av) # 数値型で結果を

print("==相乗平均、幾何平均(値の積の要素数根)==")
print(cumprod(li))
print(max(cumprod(li)))
print(1/length(li))
print(max(cumprod(li))^(1/length(li)))

print("==不偏標準偏差==")
print(sd(li))

print("==不偏分散==")
print(var(li))

print("==偏差(n、各要素が算術平均からどのくらい離れているか)==")
va_n = sapply(li, function(x) { return (x - av) } )
print(va_n)
print(var(li))

print("==標準偏差(偏差べき乗配列の総和の二乗値(分散)とその平方根(標準偏差))==")
dp_n = sapply(li, function(x) { return ((x - av) ^ 2) } )
print(dp_n)
dp = sum(dp_n) / (length(dp_n) - 1)
print("===分散")
print(dp)
print("===n-1の平方根を利用した標準偏差(統計学版)")
print(sqrt(dp))
print("===nで割った標準偏差(Excel版)")
print(sum(dp_n) / length(dp_n))


print("==クォンタイル点(最小から最大まで中央値を50%として表示)==")
print(quantile(li)) # クォンタイル点


print("==中央値==")
print(median(li))


print("==5数要約==")
print(fivenum(li))

print("==4分位偏差==")
print(IQR(li))

print("==範囲==")
print(range(li))

print("==最大、最小、平均、中央値 ==")
print(summary(li))

print("==合計値の自然対数（基数2）==")
print(log2(sum(li)))
