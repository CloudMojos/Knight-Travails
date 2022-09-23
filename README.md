
# Title Of Project

__[Knight Travails]__
(https://www.theodinproject.com/lessons/ruby-knights-travails)

Part of [The Odin Project](https://www.theodinproject.com/) Curriculum



## Instructions && Requirements

1.  Put together a script that creates a game board and a knight.
2.  Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
3.  Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
4.  Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:
```bash
  > knight_moves([3,3],[4,3])
  => You made it in 3 moves!  Here's your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
```
## Planning
### The Idea
I will start by creating a knight class which takes the dimension of the board, the start and end of the knight as parameters. The knight class will contain a function that populates the x by y matrix with hop distance from the knight. It will look like this:
|| A | B | C | D | E | F | G | H |
|--|--|--|--|--|--|--|--|--|
|**8**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**7**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**6**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**5**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**4**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**3**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**2**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
|**1**| 0 | 0 | 0 | 0 | 0 | 0 |0 |0 |
||||||||||
The board above will be represented in the program as `distance-board` array. When the knight is instantiated, and the start and end is defined, 0 will represent the starting cell.
|| A | B | C | D | E | F | G | H |
|--|--|--|--|--|--|--|--|--|
|**8**| 2 | 3 | 2 | 3 | 2 | 3 | 2 | 3 |
|**7**| 3 | 4 | 1 | 2 | 1 | 4 | 3 | 2 |
|**6**| 2 | 1 | 2 | 3 | 2 | 1 | 2 | 3 |
|**5**| 3 | 2 | 3 | 0 | 3 | 2 | 3 | 2 |
|**4**| 2 | 1 | 2 | 3 | 2 | 1 | 2 | 3 |
|**3**| 3 | 4 | 1 | 2 | 1 | 4 | 3 | 2 |
|**2**| 2 | 3 | 2 | 3 | 2 | 3 | 2 | 3 |
|**1**| 3 | 4 | 3 | 4 | 3 | 4 | 3 | 4 |
||||||||||
