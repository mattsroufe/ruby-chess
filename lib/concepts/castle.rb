class Castle < Piece

  def possible_moves
    rank_moves = (Board::RANKS - [rank]).map { |rank| [file, rank].join }
    file_moves = (Board::FILES - [file]).map { |file| [file, rank].join }
    rank_moves + file_moves
  end
end
