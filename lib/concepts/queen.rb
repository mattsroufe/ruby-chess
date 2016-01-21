class Queen < Piece
  def possible_moves
    castle = Castle.new(position)
    bishop = Bishop.new(position)
    bishop.possible_moves + castle.possible_moves
  end
end
