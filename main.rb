# Knight Class
class Knight
  attr_reader :origin, :target, :distance_board

  TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
                    [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  def initialize(origin, target)
    @origin = origin
    @target = target
    @distance_board = Array.new(8) { Array.new(8) }
    build_distance_board
  end

  private

  # Returns a i x j matrix with distance each cell
  def build_distance_board(x = origin[0], y = origin[1], hop = 0)
    # From origin, go to each of transformations, add 1 each recursion
    return if x < 0 || x > 7 || y < 0 || y > 7

    @distance_board[x][y] = hop
    TRANSFORMATIONS.each do |transformation|
      build_distance_board(x + transformation[0], y + transformation[1], hop + 1)
    end
  end
end

my_knight = Knight.new([0, 0], [1, 2])
puts my_knight.distance_board
