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


a, x = sym.symbols("a  x")

# 二次関数を解く
print(Functions.quadratic(0))
print(Functions.quadratic(4))
expr = Functions.quadratic(a)
print(expr)

# 微分を解く
print(Functions.derivative(x**2))
