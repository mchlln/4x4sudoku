# 4x4 Sudoku Solver in Haskell

This is a simple 4x4 Sudoku solver implemented in Haskell.

## Sudoku Puzzle Format

The solver expects the input puzzle to be provided as four lines of four integers each, representing rows of the puzzle. An example puzzle would look like this:

```
1000
0020
3000
0400
```

Here, `0` represents an empty cell.

## How to Run

1. **Clone the repository:**

   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Run the solver:**

    Input:

    - Enter the Sudoku puzzle as four lines of four numbers each.

    Output:

    - If a solution is found, it will print the solved Sudoku puzzle.
    - If no solution exists, it will print "no solution".

    Example:

    ```haskell
        ghci solver.hs
        ghci> main
        1000
        0020
        3000
        0400
        1234
        4321
        3142
        2413
    ```

## Code Structure

`Sudoku Type`: type Sudoku = [[Int]]

- Represents a 4x4 Sudoku grid as a list of lists of integers.

`Position Type`: type Position = (Int, Int)

- Represents a position (row, column) in the Sudoku grid.

Functions:

`solveSudoku`: Main function to solve the Sudoku puzzle. It returns Just solution if a solution is found, otherwise Nothing.

`solve`: Uses backtracking to recursively find a valid solution.

`isValid`: Checks whether the current grid configuration is valid (no duplicates in rows, columns, and 2x2 boxes).

`noDups`: Helper function to check if a list has no duplicates (excluding zeros).

## Notes

This solver is specifically designed for 4x4 Sudoku puzzles. It assumes that the input puzzles are always valid (i.e., written correctly in the right format).

The solver is built with simplicity in mind, using basic Haskell constructs and functions.

For larger problems, it needs to be optimized.