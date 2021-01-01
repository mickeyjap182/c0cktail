
class WithClass:
  """ with句 使用可能クラス """
  def __init__(self):
    print("==It's __init__() statement")

  def hoge(self):
    print("==hoge()==")

  def __enter__(self):
    print("==This __enter__() is called on starting with statement==")
    return self

  def __exit__(self, ex_type, ex_value, trace):
    print("==This __exit__() is called on exiting with statement==")
    print("exit: ", ex_type, ex_value, trace)
# print(ret)
data = []
code = """
with WithClass() as w:
    print("==inner of with statement proccess==")
    w.hoge()
"""
exec(code)
data.append(2)
