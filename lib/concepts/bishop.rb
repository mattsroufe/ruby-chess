class Bishop < Piece

  def possible_moves
    moves = []
    (Board::FILES - [file]).each do |board_file|
      if file > board_file
        diff = (board_file...file).count
      elsif board_file > file
        diff = (file...board_file).count
      end
      moves << [board_file, rank - diff].join if Board::RANKS.include?(rank - diff)
      moves << [board_file, rank + diff].join if Board::RANKS.include?(rank + diff)
    end
    moves
  end
end
