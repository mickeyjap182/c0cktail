from ctypes import cdll, c_longlong

class CallLib:

    LIBS = {}
    """
    T.B.D. you may use singleton.
    """
    @classmethod
    def add(cls, libpath:str):
        if cls.LIBS.get(libpath) :
            raise EnvironmentError("already {} was loaded.".format(libpath))
        else:
            cls.LIBS[libpath] = cdll.LoadLibrary(libpath)

    @classmethod
    def has(cls, libpath:str):
        return cls.LIBS.get(libpath) is not None

    """
    T.B.D. you may load library when it is used first time.
    """
    @classmethod
    def call(cls, libpath:str, funcName:str, *args):
        obj = cls.LIBS.get(libpath)

        # args type
        print(obj,funcName)
        # fx = getattr(obj, funcName)
        # fx.argtypes = [c_longlong]
        obj.fibonacci.argtypes = [c_longlong]

        # return type
        # fx.restype = c_longlong
        obj.fibonacci.restype = c_longlong

        # call function
        # return fx(args)
        obj.fibonacci(args)

    def __init__(self):
        pass