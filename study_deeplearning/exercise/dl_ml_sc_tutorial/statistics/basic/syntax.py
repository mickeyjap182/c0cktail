import os
import sys

class WithSyntax():
    """
    with句構文 open などはwithブロックで発生したら自動的にcloseが呼ばれる。
    __enter__ ... 初期処理後の固有処理
    __exit__ ... return Trueで例外を握りつぶす。
    __init__ -> __enter__ -> with内処理 -> __exit__ -> __del__ の順に実行
    """
    @staticmethod
    def main():
        with WithSyntax.ExampleWithClass('test') as fp:
            print("==in with block==")

    class ExampleWithClass:
        def __init__(self, message):
            print('__init__')
            self.message = message

        def __del__(self):
            print('__del__')

        def __enter__(self):
            print('__enter__')
            print(self.message)
            #raise ValueError # [LABEL C]
            return self

        def __exit__(self, exception_type, exception_value, traceback):
            print('__exit__')
            self.close()
            print('  exception_type:', exception_type)
            print('  exception_value:', exception_value)
            print('  traceback:', traceback)
            #if exc_type:     # [LABEL B]
            #    return True  # [LABEL B]

        def close(self):
            print('  close()')

        def show_msg(self, msg):
            print(msg)



if __name__ == '__main__' :
    # 1.AbstractFactory
    WithSyntax.main()

    # 2.builder

def deco2(prefix):
    import os
    def inner(func):
        def wrapper(*args,**kwargs):
            print("==deco2.wrapper==")
            # 前処理
            res = '--start--' + os.linesep
            # 対象関数の呼び出し
            res += prefix + "_" + func(*args,**kwargs)  + os.linesep
            # 後処理
            res += '--end--'
            return res
        return wrapper
    return inner

@deco2('del')
def test2(message):
    print("==test2==")
    return(message + "?")

print(test2('Hello Decorator'))
print(type(11111111))
print(type(11111111222222222222))
