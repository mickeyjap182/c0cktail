#!/usr/bin/Rscript
# ローカルレベルモデル

library(dlm)

#=====================
# 左端も推定する
#=====================

#　Step1 
#　モデル作成のための関数を作る
build.2 <- function(theta){
    dlmModPoly(order=1, dV=exp(theta[1]), dW=exp(theta[2]), m0=exp(theta[3]))
    }

#　Step2
#　MLEでパラメタ推定。

fit.2 <- dlmMLE(
  Nile, 
  parm=dlmMLE(Nile, parm=c(1,1,10), build.2,method="Nelder-Mead")$par,build.2, 
  method="BFGS"
)
fit.2

