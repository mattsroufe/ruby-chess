class Piece
  attr_accessor :position

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
