# Knight Class
class Knight
  attr_reader :origin, :target, :distance_board

  TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
                    [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  def initialize(origin)
    @origin = origin
    # Create the board, initialize the start position of the knight
    @distance_board = Array.new(8) { Array.new(8) }
    @distance_board[origin[0]][origin[1]] = 0
    # Populate the @distance_board with correct hop distance from origin to each cell
    build_distance_board
  end

  def knight_moves(curr)
    path = []
    while curr != @origin
      path << curr
      TRANSFORMATIONS.each do |move|
        if @distance_board[curr[0] + move[0]][curr[1] + move[1]] < @distance_board[curr[0]][curr[1]]
          curr = [curr[0] + move[0], curr[1] + move[1]]
          break
        end
      end
    end
    path << curr
    path.reverse
  end

  private

  # Returns a i x j matrix with distance each cell
  def build_distance_board
    # From origin, go to each of transformations, add 1 each recursion
    queue = [[@origin[0], @origin[1], 0]]
    until queue.empty?
      x, y, hop = queue.shift
      TRANSFORMATIONS.each do |move|
        next unless valid?(x + move[0], y + move[1])

        queue.push([x + move[0], y + move[1], hop + 1])
        @distance_board[x + move[0]][y + move[1]] = hop + 1
      end
    end
  end

  def valid?(x, y)
    within_board?(x, y) && @distance_board[x][y].nil?
  end

  def within_board?(x, y)
    x >= 0 && x < 8 && y >= 0 && y < 8
  end
end

my_knight = Knight.new([4, 3])
p my_knight.knight_moves([3, 4])
