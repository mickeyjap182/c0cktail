{- It is a Module. -}
module Baby where

-- 1
doubleMe x = x + x

-- 2
doubleUs x y = doubleMe x + doubleMe y

-- is 正格 (not lazy evaluation)  
bonusAdded' x = (if x < 10 then x else x + 10) + 10

-- 3
declineMe x = x - 1

threeSome x y z = x * 3 + y * 3 + z * 3

-- 2020/12/01 maybe, 部分関数, isPresent ifPresent, map, flatMap, Optional 条件分岐をカプセル化、ない場合を意識しなくていい。　ファンクタ


