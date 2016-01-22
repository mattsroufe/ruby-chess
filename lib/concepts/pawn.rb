class Pawn < Piece
  attr_reader :initial_position

  def possible_moves
    moves = attacking_moves
    moves << move(1) if board.empty?(move(1))
    moves << move(2) if moves.include?(move(1)) && board.empty?(move(2)) && at_start_position?
    moves
  end

  def attacking_moves
    moves = []
    right = [Board::FILES[file_index + 1], rank + 1].join
    left = [Board::FILES[file_index - 1], rank + 1].join
    moves << right if file_index < 7 && board.find_piece_by_position(right)
    moves << left if file_index > 0 && board.find_piece_by_position(left)
    moves
  end

  def at_start_position?
    {black: 7, white: 2}[color] == rank
  end

  def move(int)
    int = -int if color == :black
    [file, rank + int].join
  end
end

__END__

An object plays a role like a business owner.  Cooridination should typically be between two other objects.
Just like a good business owners, effective objects coordinate betweeen objects.

I feel very good about this because this is how you would describe this same scenario in English. When you look at a chess board
and think about your next move, the first thing you'll have to know is your possible moves.
