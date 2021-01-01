{- 
"do" is nessesary for us, and we'll run multiple line's code.
-}

-- it is import statement. please use :l on interactive mode.
import Data.Typeable

import Baby as B


main = do 
    print("== type:Int...Bounded and Integer...not Bounded ==")
    --  Int is Bounded (有界)
    let a1 = minBound :: Int
    --  Integer is not Bounded (有界ではない)
    let a2 = 10 :: Integer 
    -- print is enable to Output ALL Type.
    print(a1) 
    print(a2) 

    -- b <- return 2
    -- print(b + 5)
     
    -- (c <- return 2
    -- return ((c + 1) * d)
    -- where 
    --     d = 3
    -- )
    -- print(c)

    print("== type:boolean ==")
    let bool_t = not False
    let bool_f = False && True
    print bool_f
    print(bool_t)

    -- print each type. 
    print("== type of False ==")
    print(typeOf bool_f)      
    print("== type of 4 :: Int ==")
    let var_1 = 4 :: Int
    print(typeOf var_1)      
    print("== type of 4 :: Integer ==")
    let var_2 = 4 :: Integer
    print(typeOf var_2)      
    print("== type of apple ==")
    let var_3 = "apple"
    print(typeOf var_3)      
    print("== type of [\"a\",\"b\",\"c\"] ==")
    let var_4 = ["a", "b", "c"]
    print(typeOf var_4)      
    print("== type of (True, 'a', False , 'b') ==")
    let var_5 = (True, 'a', False , 'b')
    print(typeOf var_5)      

    --  fst :: (a, b) -> a : 多相的関数 ... 何型かというよりも型安全を保ったまま動作できるようにしている。
    let first_one1 = fst("apple", "banana")
    let first_one2 = fst(3, 4)
    print(first_one1)
    print(first_one2)


    print("== Class Eq type : 5 == 5 ==")
    print( 5 == 5)
    print("== Class Ord type : 5 `compare` 5 ==")
    print( 5 `compare` 5)
    print("== Class Show is to String : show 123 ==")
    print( show 123)
    print("== Class Read is guess type : read \"123\" :: Integer ==")
    print(read "123" :: Integer)

    print("== Class Enum is enumaration :  ==")
    print(['a','c'..'x'])
    print([LT .. GT])
    print(succ 'c')
    print(pred 'c')


    print("== Class Bounded is Multi-Layer constant 多層定数 for upper limit and lower limit :  ==")
    print(minBound :: Int)
    print(maxBound :: Int)
    print(maxBound :: Char)
    print(maxBound :: Ordering)

    print("== Class Num is Multi-Layer constant 多層定数　Integer/Int/Float/Double :  ==")
    print(20 :: Int)
    print("apples" :: [Char])

    print("== Class Floating is 　Float/Double : ==")
    print(sin 20.0)

    print("== Class Integral is Int/Integer :  ==")
    print(fromIntegral(20::Integer) )
    -- fromIntegral bring you to converting Int or Integer to Num class.
    let inte = fromIntegral(20::Integer) 
    print(sin inte)
