# 統計学メモ

## 説明変数と説明される変数
- 分析対象のデータの型の特徴を抜き出す
- 説明する変数...x、説明される変数の判断材料、説明変数、独立変数、予測変数、共変数
- 説明される変数...y、予測したい変数、応答変数、目的変数、被説明変数、従属変数、基準変数

## 平均、分散
- 相加平均(算術平均)...各値の和を値の個数でわる。
- 相乗平均、幾何平均(値の積の要素数根)...各値の積を
- 偏差(相加平均のから値への差の二乗値を各個求めた上で、差をだす。)
- 分散(相加平均のから)
- 標準偏差(偏差べき乗配列の総和の二乗値(分散)とその平方根(標準偏差))
- 外れ値

## 用語
- ベルヌーイ試行
- 独立と条件付き確率
- 平均分布(ベル型、右に裾が長い、一様など)
- データ抽出（標本は無作為に抽出すること）

- 線形モデル
- 重回帰モデル
- 標準正規分布 (ガウシアン分布)


## クラスタリング

## 主成分分析

# 実務

- データクレンジング、正規化
不適切なデータの除外・適正化、数値化する

- モデル作成

- 仮説
ここが難しい。データ分析

- 実証


# deployment
an environment for developing python application.
h1.packages
+ anaconda
+ jupyter
+ RScript
+ node & angular cli

git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/mickeyjap182/insect_rasp.git
git push -u origin master

h1. example for launch command.
sudo docker run -it -p 9000:3000 -v <your_local_path>:/var/app --name "analysys" <this_docker_image_id> /bin/bash

h1. about applications
# launch jupyter at port 3000
jupyter notebook
# configuration file is following contents. open http://127.0.0.1:9000.
~/.jupyter/jupyter_notebook_config.py

# launch angular app in app's directory. open http://127.0.0.1:9000.
・ng serve --host=0.0.0.0 --port 3000


# launch jupyter
jupyter notebook
# configuration file is following contents.
~/.jupyter/jupyter_notebook_config.py


# launch angular app in app's directory.
・ng serve --host=0.0.0.0 --port 300
