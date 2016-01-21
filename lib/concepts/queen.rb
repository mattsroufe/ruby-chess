class Queen < Piece
  def possible_moves
    castle = Castle.new(color, position)
    bishop = Bishop.new(color, position)
    bishop.possible_moves + castle.possible_moves
  end
end
