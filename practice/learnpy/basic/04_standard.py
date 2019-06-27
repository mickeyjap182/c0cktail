
class StringMethods():
    DI = {
        'a':'aaa ',
        'b':'\tbb bb\t',
    }

    def main(self):
        cls = self.__class__
        print("{}. ==== {} ====".format(1, "strip"))
        a_sp = cls.DI.get('a').strip()
        print("strip()_result:{}. str_length:{} ====".format(a_sp, len(a_sp)))
        # print(di.get('aa').strip()) # error!
        b_sp = cls.DI.get('b').strip(" ")
        print("strip(' ')_result:{}. str_length:{} ====".format(b_sp, len(b_sp)))
        b_tab = cls.DI.get('b').strip("\t")
        print("strip('\\t')_result:{}. str_length:{} ====".format(b_tab, len(b_tab)))
        print()


        print("{}. ==== {} ====".format(2, "split"))
        print(cls.DI.get('b').split("\t"))

s = StringMethods()
s.main()
