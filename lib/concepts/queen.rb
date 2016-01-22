class Queen < Piece
  def possible_moves
    castle = Castle.new(board, color, position)
    bishop = Bishop.new(board, color, position)
    bishop.possible_moves + castle.possible_moves
  end
end
