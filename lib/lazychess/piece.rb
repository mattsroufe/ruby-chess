class Piece
  attr_accessor :position

  HOR_POS = ["a", "b", "c", "d", "e", "f", "g", "h"]

  def initialize(position)
    @position = position
  end

  def rank
    position[1].to_i
  end

  def file
    position[0]
  end
end
