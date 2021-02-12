{- 
It is based "Learn You a Haskell for Great Good!" from Miran Lipovaca.
and It's just a personal practice for me.
"do" is nessesary for us, and we'll run multiple line's code.
-}

-- it is import statement. please use :l on interactive mode.
import Baby as B
import Text.Printf 

-- global defined
global_version :: Double
global_version = 2.1

-- return first argument 'a'
first a b  = a
-- re-entrant formula has never end.
reent a = reent (a - 1)

main = do 
    print("-- if must be return value. so 'else' is necessary. ")
    let b = 200 :: Float
    print(if b < 200 then True else False)
    let b = 199.9 
    print(if b < 200 then True else False)
    print(not (if b < 200 then True else False))

    print("-- call Function by 'Prefix Notation'")
    print(B.bonusAdded' 9)
    print(B.bonusAdded' 10)
    print(min 10 4)
    print(max 4 5)

    print("-- call Function on other program files.")
    print(B.doubleMe 4)
    print(B.declineMe 4)
    print(B.threeSome 2 3 4)


    -- print("-- cdefined functions")
    -- let addret = add 3 4 
    -- print(addret)

    {-  
      ?? why It must recieve by a variable ?? 
    -}

    let les = pis' 4.0

    let word = removeNonUpperCase "WinterSaleIsNowOnSale!"
    print(word)

    let factret = factorial 50
    print(factret)

    let nofactret = nofactorial 5
    print(nofactret)

    let ara = isLucky 5
    print(ara)
    let ara = isLucky 7
    print(ara)
    
    let fibonacci = [fibo(x) | x <- [0..10] ]
    print(fibonacci)

    print(head' "abcde")
    print(head' [4, 7, 10])

    print(tell [4, 7, 10])
    print(tell "ab")
    print(tell [2])
    print(tell "")
    
    print("== bad sum pattern with crush ==")
    print(badAdd([1, 3, 5]))
    print(badAdd [1, 3, 5]:: Integer)
    print(badAdd [1, 3, 5])
    -- print(badAdd [1, 3]) -- Runtime Error.

    print("== 'AS' pattern ==")
    print(firstLetter "")
    print(firstLetter "a")
    print(firstLetter "apple")

    print("== original function ==")
    print(max 2 4)
    print(2 `max` 4)
    print(global_version)

    let r = 2.0 :: Double 
        h = 3.0 :: Double
    print(cylinder r h)

    print("== 'first 6 (reent 4)' will be accompleshed. Because, 'first 6 x' always returns 6, and there is no necessary to evaluate re-entrant formula 'reent 4' as 'x'. ==")
    print(first 6 (reent 4))




    {- 関数コール不可のため要検証
    let tu1 = ((2.0 , 3.0)) :: (Double,Double)
    let tu2 = ((2.0 , 3.0)) :: (Double,Double)
    tuppleMatch(tu1, tu2)
    -}

    -- print(fac 2 )
    -- let abc = factorial 100
    -- print(abc)
--  Int is Bounded (有界)
pis'  :: Double -> Double 
pis' r = 2 * pi * r

removeNonUpperCase :: [Char] -> [Char]
removeNonUpperCase st = [ 
    c | c <- st, 
    c `elem` ['A' .. 'Z']
    ]

add :: Int -> Int -> Int
add x y = x + y

-- 1 * 2 * 3 * ... n
nofactorial :: Int -> Int
nofactorial n = product [1..n]

-- 1 * 2 * 3 * ... n
factorial :: Integer -> Integer
factorial n = product [1..n]

-- pattern match
isLucky :: Int -> String
isLucky x
    | x == 7 = "Lucky!"
    | otherwise = "Not Great..."

-- fibonacci sequence by gard
fibo :: Int -> Int
fibo n
    | n < 0 = 0
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fx
    where fx = fibo(n - 1) +  fibo(n - 2) --  This is the statement define and cache a variable. It uses recursions.

-- pattern match tupple
tuppleMatch :: (Double, Double) -> (Double, Double) -> (Double, Double)
tuppleMatch (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- 
head' :: [a] -> a
head' [] = error "empty!"
head' (x:_) = x

-- PATTERN MATCHING -- first, second element are existed? 
tell :: (Show a) => [a] -> String
tell [] =  "The list is empty."
tell  (x:[]) = "The list has one element:" ++ show x
tell  (x:y:[]) = "The list has two element" ++ show x ++ " and " ++ show y
tell  (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- It requires 3 elements.
badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z

-- `AS` pattern. all references as same as input String, x is a first letter, y is leftover.
firstLetter :: String -> String
firstLetter "" = "Ver:" ++ show global_version ++ " Empty string, whoops!"
firstLetter all@(x:y) = "Ver:" ++ show global_version ++ " The first letter of " ++ all ++ " is " ++ [x] ++ ", and left is " ++ y

-- if you add ' , you can also use as a Neutral function,
max' :: (Ord a) => a -> a -> a 
max' a b
    | a <= b = b
    | otherwise = a
-- calicurate surface area of cylinder 
cylinder :: Double -> Double -> Double
cylinder r h = 
    let sideArea = 2 * pi  * r * h
        topArea = pi * r ^ 2
    in  sideArea + 2 * topArea

-- higher order function.
