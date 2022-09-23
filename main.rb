# GameBoard Class
class GameBoard
  attr_accessor :board
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @board = Array.new(x) {Array.new(y)}
  end
end

# Knight Class
class Knight

  def initialize()

  end

  private

  # Returns a i x j matrix with distance each cell
  def distance_board()

  end
end

my_game_board = GameBoard.new(8, 8)
p my_game_board.board[0][0]
my_knight = Knight.new()
