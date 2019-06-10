import sys

class AbstractFactory():
    """ abstruct ファクトリー """
    @staticmethod
    def create_viecle(cls):
        viecle = cls.Viecle()
        cls.start(viecle)
        cls.forward(viecle)
        return viecle

    class CarFactory():
        @staticmethod
        def start(cls):
            return cls.startup()

        @staticmethod
        def forward(cls):
            return cls.move()

        class Viecle():
            PASSENGERS = 5
            def get_max_speed(self):
                print('==160km/h==')
                print(self.PASSENGERS)

            @staticmethod
            def move():
                print('==wheel on road==')

            @staticmethod
            def startup():
                print('==kick engine==')

    class TrainFactory(CarFactory):

        class Viecle():
            PASSENGERS = 5000
            def get_max_speed(self):
                print('==220km/h==')
                print(self.PASSENGERS)

            @staticmethod
            def move():
                print('==wheel on rail==')

            @staticmethod
            def startup():
                print('==connect power==')

    @staticmethod
    def main():
        """ 車と電車のクラス及び機能を作成 """
        print("==AbstructFacroryパターン==")
        car = AbstractFactory.create_viecle(AbstractFactory.CarFactory)
        car.get_max_speed()
        train = AbstractFactory.create_viecle(AbstractFactory.TrainFactory)
        train.get_max_speed()

class Builder():
    """ builder  """
    @staticmethod
    def create_viecle(cls):
        viecle = cls.Viecle()
        cls.start(viecle)
        cls.forward(viecle)
        return viecle
    @staticmethod
    def main():
        """ 車と電車のクラス及び機能を作成 """
        car = AbstractFactory.create_viecle(AbstractFactory.CarFactory)
        car.get_max_speed()
        train = AbstractFactory.create_viecle(AbstractFactory.TrainFactory)
        train.get_max_speed()

if __name__ == '__main__' :
    # 1.AbstractFactory
    AbstractFactory.main()

    # 2.builder
