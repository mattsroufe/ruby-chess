class Move
  attr_reader :piece

  class NoPieceError < StandardError; end

  def initialize(pieces, old_position, new_position)
    @pieces       = pieces
    @old_position = old_position
    @new_position = new_position
    @piece        = pieces.find { |piece| piece.position == old_position }
    raise NoPieceError unless @piece
  end

  def valid?
    false
  end
end
