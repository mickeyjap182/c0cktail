{- 
"do" is nessesary for us, and we'll run multiple line's code.
-}

-- it is import statement. please use :l on interactive mode.
import Baby as B
import Control.Applicative

main = do 
    -- maybe monad
    let a1 = return 4 :: Maybe Int
        a2 = Just 4 
    -- maybe
    print(a1, a2) 

    -- pipeline $
    let b1 = take 3 [1,2,3,4,5] 
    print(b1)

    print(try_01 "Param1")
    print(try_01 "Param2")
    -- 
    print $ fact (-1)
    print $ fact 5

-- sub function statement
try_01 :: String -> String
try_01 x  
       | x == "Param1" = "Return" ++ x
       | x == "Param2" = "Return2"
       | x == "Param3" = "Return3"
       | otherwise = "null"

fact 0 = Just 1
fact n | n > 0     = (n *) <$> fact (n - 1)
       | otherwise = Nothing

