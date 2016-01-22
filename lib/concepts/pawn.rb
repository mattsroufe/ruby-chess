class Pawn < Piece
  attr_reader :initial_position

  def possible_moves
    moves = attacking_moves
    moves << move(1) if board.empty?(move(1))
    moves << move(2) if moves.include?(move(1)) && board.empty?(move(2)) && at_start_position?
    moves
  end

  private

  def attacking_moves
    moves = []
    right = [Board::FILES[file_index + 1], rank + 1].join
    left = [Board::FILES[file_index - 1], rank + 1].join
    moves << right if file_index < 7 && board.find_piece_by_position(right)
    moves << left if file_index > 0 && board.find_piece_by_position(left)
    moves
  end

  def at_start_position?
    color == :black ? rank == 7 : rank == 2
  end

  def move(int)
    [file, rank + int].join
  end
end
