class Piece
  attr_accessor :color, :position

  HOR_POS = ["a", "b", "c", "d", "e", "f", "g", "h"]

  def initialize(color, position)
    @color    = color
    @position = position
  end

  def rank
    position[1].to_i
  end

  def file
    position[0]
  end

  def short_name
    self.class.to_s[0]
  end
end
