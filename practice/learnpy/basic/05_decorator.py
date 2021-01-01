import os
envs = os.environ

#print(envs)

# static decorator
def dec(func):
    def wrapper(*args, **kwargs):
        print("--start args:{} kwargs:{}".format(str(args), str(kwargs)))
        result = func(*args, **kwargs)
        print("--end--")
        return result
    return wrapper

@dec
def main(message, option) -> str:
    print("message:{} option:".format(message, option))
    return message + ':' + option

ret = main('hello', "yuko")
print(ret)


# variable  decolator
""" decorator with arguments """
def decarg(label_no):
    """ define decorator_method, argument is function """
    def _decorator_method(func):
        """ define decorator_method, argument is function """
        def wrapper(*args, **kwargs):
            print("--start label_no:{} args:{} kwargs:{}".format(str(label_no), str(args), str(kwargs)))
            new_arg = (args[0], args[1] + "&" + str(label_no))
            result = func(*new_arg, **kwargs)
            print("--end--")
            return result
        return wrapper
    return _decorator_method

SOMEONE = 'KEN'
@decarg(SOMEONE)
def main2(message, option) -> str:
    print("message:{} option:".format(message, option))
    return message + ':' + option

ret = main2('hello', "yuko")
print(ret)
