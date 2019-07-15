import sys
import math
import random
import numpy as np
import sympy as sym
from sympy.plotting import plot

class Functions():

    @staticmethod
    def quadratic(x):
        """ x^2 + 3x + 3 の関数を計算　"""
        return (x ** 2) + (3 * x) + 2

    @staticmethod
    def derivative(expr):
        """ 微分 """
        return sym.Derivative(expr).doit()


# 特定の記号を数学的な変数として扱う。
a, x = sym.symbols("a  x")

# 二次関数を解く
print("==二次関数式:{expr}==".format(expr="y=0^2 + 3*0 + 2"))
print(Functions.quadratic(0))
print("==二次関数式:{expr}==".format(expr="y=4^2 + 3x4 + 2"))
print(Functions.quadratic(4))
print("==二次関数式:{expr}==".format(expr="y=a^2 + 3xa + 2"))
expr = Functions.quadratic(a)
print(expr)

# 微分を解く
print("==微分式:{expr}==".format(expr="x ^ 2"))
print(Functions.derivative(x**2))
