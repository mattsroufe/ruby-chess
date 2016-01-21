class Player
  attr_reader :pieces, :moves

  def initialize
    @pieces = []
    @moves = []
  end

  def move(position)
    file = position[0]
    piece = pieces.find { |piece| piece.position[0] == file }
    piece.position = position
  end

  def find_piece_at(position)
    pieces.find { |piece| piece.position == position }
  end
end
