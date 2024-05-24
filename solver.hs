{-
    4x4 sudoku solver in haskell
-}
import Data.List (transpose)
import Data.Maybe (listToMaybe)
import Control.Monad (guard)

type Sudoku = [[Int]]
type Position = (Int, Int)

main :: IO ()
main = do
    input <- sequence [getLine, getLine, getLine, getLine]
    let sudoku = map (map (read . (:[]))) input
    case solveSudoku sudoku of
        Nothing -> putStrLn "no solution"
        Just solution -> mapM_ (putStrLn . concatMap show) solution

solveSudoku :: Sudoku -> Maybe Sudoku
solveSudoku grid = listToMaybe (solve grid)

solve :: Sudoku -> [Sudoku]
solve grid
    | isSolved grid = [grid]
    | otherwise = do
        let pos = firstEmptyPosition grid
        num <- [1..4]
        let newGrid = placeNumber grid pos num
        guard (isValid newGrid)
        solve newGrid

isSolved :: Sudoku -> Bool
isSolved = all (all (/= 0))

firstEmptyPosition :: Sudoku -> Position
firstEmptyPosition grid = head [(row, col) | row <- [0..3], col <- [0..3], grid !! row !! col == 0]

placeNumber :: Sudoku -> Position -> Int -> Sudoku
placeNumber grid (row, col) num =
    take row grid ++
    [take col (grid !! row) ++ [num] ++ drop (col + 1) (grid !! row)] ++
    drop (row + 1) grid

isValid :: Sudoku -> Bool
isValid g = all noDups (rows g) &&
            all noDups (cols g) &&
            all noDups (boxes g)
  where
    rows = id
    cols = transpose
    boxes g = [[g !! r !! c | r <- [boxrow..boxrow+1], c <- [boxcol..boxcol+1]] | boxrow <- [0, 2], boxcol <- [0, 2]]

noDups :: [Int] -> Bool
noDups [] = True
noDups (x:xs)
    | x == 0 = noDups xs
    | otherwise = (notElem x xs) && noDups xs
