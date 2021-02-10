{- 
It is based "Learn You a Haskell for Great Good!" from Miran Lipovaca.
and It's just a personal practice for me.
It is exersise for　"higher order function".
-}

-- it is import statement. please use :l on interactive mode.
import Baby as B
import Text.Printf 
import Prelude

-- global defined
global_version :: Double
global_version = 2.1

main = do 

    print("-- carried. --")
    print(curried 2 4 5)

    print("-- section. --")
    print(section 1.0 ::Float)
    print((/10) 1.0 ::Float)
    print((+1.0) 1.0 ::Float)

    print(section2 'A')
    print(section2 '2')
    print(compareToHundred 90)
    print(compareToHundred2 102)
    print(plus 2 4)
    print(plus2 3.0 2.0)

    print(applyTwice (+3) 10)
    -- highere( "test" ++ ) "after"
    
    
    -- print( substract "aaa" 2 )

    -- print( maxim 2 4)
    -- print(compare 2 4)s
{- currying flow -}
-- e.g.) curried 2 4 5
-- 1.At first The function apply to the first argument x and return applied function.
--   2 y z = 2 * y * z -> return y z = 2 * y * z
-- 2.Next, The returned function apply to the first argument y and return applied function.
--   4 z = 2 * 4 * z = 8 * z -> return  z = 8 * z
-- 3.Finally,  The returned function apply to the final argument y and return applied function.
--   5 = 2 * 4 * 5 = 40 

curried :: Int -> Int -> Int -> Int
curried x y z = x * y * z

section :: (Floating a) => a -> a
section  = (/10)

-- nutral function 
section2 :: Char -> Bool
section2  = (`elem` ['A'..'Z'])
-- section3' :: String -> Integer -> String
-- section3' st num = st 


uncurried :: Int -> Int -> Int
uncurried x y = x * 10 + y

-- maxim :: (Ord a) => a -> a -> a
-- maxim x y = compare x y

-- it returns Ordering result.
-- Int -> Ordering ... x ->  x `compare` 100  
compareToHundred :: Int -> Ordering
compareToHundred x =  x `compare` 100

-- compare returns the 'Function of Ordering with param:100 '.
-- compare is (Ord a) => a -> (a -> Ordering)
compareToHundred2 :: Int -> Ordering
compareToHundred2  =  compare 100


plus :: Int -> Int -> Int
plus x y =  x + y

plus2 :: Double -> Double -> Double
plus2 x y =  x + y

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- (a -> a) means function recieve a and return a 
{-
highere :: (a -> a) -> a -> a
highere f x = f (f x)
-}