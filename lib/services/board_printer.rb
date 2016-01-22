class BoardPrinter
  FILE_LETTERS = ("A".."H").to_a
  def print(board)
    board_string = ""
    Board::RANKS.reverse.each do |rank, index|
      board_string << "#{rank} | "
      Board::FILES.each do |file|
        piece = board.find_piece_by_position("#{file}#{rank}")
        board_string << (piece ? [piece.color[0], piece.short_name, ' '].join : '   ')
      end
      board_string << "|\n"
    end
    board_string << "    " + FILE_LETTERS.join('  ')
    board_string
  end
end