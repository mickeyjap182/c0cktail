import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from keras.models import Sequential
from keras.layers import Dense, Activation
from keras.datasets import cifar10
from keras import utils


(x_train, y_train), (x_test, y_test) = cifar10.load_data()
from pprint import pprint; pprint('==test==')
print(x_train.shape)
print(y_test.shape)
print('==x_test==')
print(len(x_test[0]))
print(len(x_test[0][0]))
print(len(x_test[0][0][0]))
# 前処理
# x_train = x_train.reshape(60000, 784).astype('float32') /255
x_train = x_train.reshape(50000, 3072).astype('float32') /255 # x_train 50000 * 32 * 32 * 3
x_test = x_test.reshape(10000, 3072).astype('float32') /255 # x_test 10000 * 32 * 32 * 3

y_train = utils.np_utils.to_categorical(y_train.astype('int32'),10)
y_test = utils.np_utils.to_categorical(y_test.astype('int32'),10)


# モデルの作成
# 全結合層3層のみ、Dropoutは、訓練時に一定確率で中間層を無視する関数(過学習防止)

# # モデルの作成
# model = Sequential()
#
# # モデルにレイヤーを積み上げていく
# model.add(Dense(units=64, input_dim=100))
# model.add(Activation('relu'))
# model.add(Dense(units=10))
# model.add(Activation('softmax'))
#
# # 訓練プロセスの定義
# model.compile(loss='categorical_crossentropy',
#                       optimizer='sgd',
#                                     metrics=['accuracy'])
#
# # 訓練の実行
# # x_train = np.array([1, 4, 6, 8, 1, 2])
# # y_train = np.array([2, 4, 7, 2, 5, 6])
# # (x_train, y_trainはNumpy行列の学習データ)
# model.fit(x_train, y_train, epochs=5, batch_size=32)
#
# # 予測の実行
# classes = model.predict(x_test, batch_size=128)
