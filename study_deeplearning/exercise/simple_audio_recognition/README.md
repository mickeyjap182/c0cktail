# 学習内容

[参照]
https://lib-arts.hatenablog.com/entry/audio_recognition1
tensorflow tutrial

[ベース]
https://www.tensorflow.org/tutorials/sequences/audio_recognition

## 概要
1秒くらいの音声データで作成されたデータセットを使い学習する。

左上端から、右下端に向かう対角成分が大きくなれば、
データが当たってきていることを表す。

単位は10クラス or 12クラスとなる。

データ結果を得る。

出力、コンフィデンス
12クラス問題で確率としてです。
left

コンフィデンス...softmaxから出てくる最適化されたスコア

mnistで確信度が出るのと同じニュアンス。


## 中身探す

論文で言及されているモデルを使っている

学習が早く理解しやすいイントロダクション
RNN recurrent network

webnetで音声合成に使われている。
directed consulting resolution

consal conglesion

隠れ層
↑
inputを行う


時系列モデル（過去から未来を予測）
音声も系列データと捉える。
系列モデルを扱うモデル。

receptive field
アプトプット作成するに当たって作成するインプット

このやり方だと狭い。


almaとかの時系列モデル？

音声
音声合成は、先に合成して出すために
receptive field は大きくする必要がある。


ニューラルはあまりそうを大きくしない。
10そうぐらい？

画像認識に見識があるとやりやすい。
二次元の空間的な情報ではないのか。
特徴的なものは。


## 論文の読み方。
・abstract を読んで、わからないところを参照していく。
・違う言葉を使っているので対比で読み解いていく。
・8割くらいの理解度で。
・イメージをつけるのが大事。

・KWSタスク
keyword spottingタスク

発話のキーワードを取り上げる処理
音声からキーワードを取り出すタスク。


DNN...全結合を中心とする。この論文では。
CNN...畳み込み

MLP ... マルチレイヤpcトロン

Posteria handling
事後確率（ベイズみたいな意味ではなくふわっと簡単に）


multiplationは応用。


▼▼▼カテゴリ問題▼▼▼
・12個(go)


▼音声データ

波で表すデータ
・1秒でサンプリングした音声データ
・時間単位で畳こみをかける。
・1秒の音声データから特徴量を抜き出す。

・畳み込みをする。

▼処理の説明
MSCC...
（ここは変わらないかもしれない。）


1.convert to frames
切り出す。
変換ノイズとる

2.take discreate foulier transform
フーリエ変換...テーラー展開と同じで
関数を級数展開する。
関数を級数にわけて別の表現に切り替える。
sin/cosのような正弦波などに変換する。
周期の違うもの同士を足し合わせて（高周波+低周波）、表現を変える。

frequencyに対する係数を表す。→特徴を抜く
低周波との補正をかけている。

・人間は高周波を聞き流している？
高周波がノイズになるので、高周波の成分を減らす
Flequencyを変化させる。

でかいのが重要で残すけど、
mel spectra で補正
その後フーリエ変換


3.Take log of amlefire

4.

5,


N * N * R

input の大きさは同じ出ないと行けないか。

最終的に固定長にする必要か。

・音声特徴量は全部で
44000/s と大きいので、抜く必要がある。

・音声認識の論文
Mel Frequency Capistral Confficents for music modeling


## コードリーディング
https://lib-arts.hatenablog.com/entry/implement_dl7
https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/speech_commands/train.py

・処理の全体像
・アーキテクチャ読む
・音声

## main関数を読む。
tf.app.run(main=main)

kerasのAPIを使っている、ものがある。
tensorflow...keras
ゴリゴリの人以外はpytorchに言っているみたい。

classicなtensorflowの場合はgraphを使っている。
行列演算を使う。
MLP(wxp) →を使う。
tensorflowは演算をグラフで表すことで、
直感的に読み取れるように設計されている。
グラフはどこで作っているか。

畳み込みの部分

## コードリーディングでは以下に着目する
1.architecture
2.loss
3.optimize

・optimize系の実装を探す。（最小値問題）
→評価の基準が必要で、lossがインプットされる。
train_step ()→勾配降下法なのでoptimize?

cross_entropy_mean
→loss 誤差関数だろう。

softmax_cross_entropy()


ground_truth_input, logitsを入れて→

coross_entorpyが最小になるような
値を計算してるなーくらいの理解で、
しっかり読んで理解しなくてもOK。

3クラス分類問題。

logitsを追っていくと。
optimizerやmodelの記述が長くなる。
input を入れたら、モデルを作成。する。
畳み込み層の部分を行う。


audio_precesserで

MFCC の
定義されている。音解析の部分はtensorflow本体。

CNNがベース。

## 処理する
画像認識のイメージタスクの分類タスク
データセットを探す。
ベンチマークを測るためには、データセット部分
やりたいタスクをするためのデータセットはあるか。

※5万、10万で調査レポートや提案も行う。
