{- 
"do" is nessesary for us, and we'll run multiple line's code.
-}

-- it is import statement. please use :l on interactive mode.
import Baby as B
import Text.Printf 

-- 
eval src = expr $ words src
expr (x:"+":y:_) = read x + read y　-- 字句解釈:演算子
expr (x :_) = read x -- 型推論

main = do 

    -- minimum value of Int
    let a = minBound :: Int
    -- print is enable to Output ALL Type.
    print(a) 

    print("==== print List ====")
    let ir1 = 10 :: Integer
    let i1 = 10 :: Int
    let i2 = 20 :: Int
    let i3 = fromIntegral ir1 -- integer to int.
    let l1 = [1, 3 ,5]
    let l2 = [7, 9..13]
    let l3 = []
    let l4 = 10:[]
    let l5 = i1:i2:i3:[]
    print(l1) 
    print("-- concat second list behind first list  --")
    print(l1 ++ l2)
    print("--- It must be same depth. --")
    print([l1] ++ [l2])
    print("--- merge char lists. --")
    print(['P','E'] ++ ['E','R'])
    print("--- list cons operator, and push first index.  --")
    print(4:l1)
    print("--- access part of list by index.   --")
    print(l1 !! 1)
    print("--- access part of list by index.   --")
    print(l4)
    print(l5)

    print("-- The way to hanlde list. --")
    print(head l2)
    print(unwords ["1", "3" , "5" ])
    print(last l2)
    print(init l2)
    print(tail l2)
    print(if null l2 then [0] else reverse l2)
    print(if null l3 then [0] else reverse l3)
    print(take ((length l2) - 1) l2 )
    print(drop ((length l2) - 1) l2 )
    print(maximum(l2 ++ l1 ))
    print(minimum(l2 ++ l1 ))
    print(sum(l2 ++ l1 ))
    print(product(l2 ++ l1 ))
    print("-- center. --")
    print("-- Does list have elem, or not? --")
    print(3 `elem` l1)

    

    let l4 = [16, 32.. 16*8]
    print(l4)
    print("-- or infinity list. and lazy evaluation=遅延評価. --")
    let l4_2 = take 16 [16, 32..]
    print(l4_2)
    let l5 = take 18 (cycle l1)
    print(l5)
    let l6 = take 4 (repeat l1 )
    print(l6)
    let l7 = replicate 4 l1
    print(l7)
    print("-- double, float values are not expected. --")
    print([0.1, 0.3..1.0])

    print("-- list comprehension=リスト内包表記 --")
    -- 1: before part. apply each list elem.
    -- 2: after part. make list, addtional application.
    let l8 = [x - 3  | x <- [1,3..11] ]
    print(l8)
    let l9 = [ if x < 30 then "LOW:" ++  (show x) else "HIGH:" ++ (show x) | x <- [1..50], x `mod` 5 == 4, x >= 10 ]
    print(l9)
    let l10 = [ x * y | x <- [2, 4, 6], y  <- [1, 3, 5]]
    print(l10)
    print("-- make triangle 1.Integer 2.side's 3.arround --")
    -- 1. answer is each sides : a , b and c.
    -- 2-1. all side's length are between 1 and 10
    -- 2-2. According to Pythagorean theorem, a^2 + b^2 = c^2 
    -- 2-3. total side length is 24

    let triangle = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24 ]
    
    print("-- tupple --")
    let t1 = zip [1,2,3,4,5] ["apple","banana","citron","dragonF","elderBerry"]
    print(t1)


    let prac002 = (-) 10 1
    print(prac002)
 
    -- print(sort("juice"))

    print("-- eval --")
    print(eval "1 + 3")

    
