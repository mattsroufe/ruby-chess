class Move
  def initialize(pieces, piece, new_position)
    @pieces       = pieces
    @piece        = piece
    @new_position = new_position
  end

  def valid?
    return true if @piece.class == Pawn
    false
  end
end
