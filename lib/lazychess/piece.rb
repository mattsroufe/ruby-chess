class Piece
  attr_accessor :board, :color
  attr_reader :position

  class IllegalMoveError < StandardError; end

  HOR_POS = ["a", "b", "c", "d", "e", "f", "g", "h"]

  def initialize(board, color, position)
    @board    = board
    @color    = color
    @position = position
  end

  def position=(new_position)
    raise IllegalMoveError unless possible_moves.include?(new_position)
    @position = new_position
  end

  def rank
    position[1].to_i
  end

  def file
    position[0]
  end

  def file_index
    Board::FILES.index(file)
  end

  def short_name
    self.class.to_s[0]
  end
end
