-- 2014 Autumn

sort :: (a -> a -> Bool) -> [a] -> [a]
sort _ [] = []
sort pred (x:xs) =
    let smaller = sort pred (filter (pred x) xs)
        bigger = sort pred (filter (not . pred x ) xs)
    in smaller ++ [x] ++ bigger

-- 2014 Summer

mapEveryOther :: (a -> a) -> [a] -> [a]
mapEveryOther _ [] = []
mapEveryOther f [x] = [f x]
mapEveryOther f (x:y:xs) = f x : y : mapEveryOther f xs

-- 2015 January
afterFilter :: (a -> Bool) -> [a] -> [a]
afterFilter _ [] = []
afterFilter _ [_] = []
afterFilter f (x:y:xs)
  | f x = y : afterFilter f xs
  | otherwise = afterFilter f (y:xs)

-- 2015 Autumn
revCount :: [a] -> [Int] -> [a]
revCount letters numbers = concatMap reverse $ zipWith replicate numbers letters

revCount' :: [a] -> [Int] -> [a]
revCount' [] _ = []
revCount' _ [] = []
revCount' (c:cs) (n:ns) = revCount' cs ns ++ replicate n c

repeat' :: a -> Int -> [a]
repeat' _ 0 = []
repeat' c n = c : repeat' c (n-1)

repeat'' ::  a -> Int -> [a]
repeat'' = flip replicate
