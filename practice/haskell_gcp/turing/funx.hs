{- 
"do" is nessesary for us, and we'll run multiple line's code.
-}

-- it is import statement. please use :l on interactive mode.
import Baby as B
import Text.Printf 

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



 

    

