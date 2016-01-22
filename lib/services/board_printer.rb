class BoardPrinter
  FILE_LETTERS = ("A".."H").to_a
  ENCODING = 'utf-8'

  def initialize
    @unicode_dict = UnicodeChess.new
  end

  def print(board)
    board_string = ""
    Board::RANKS.reverse.each do |rank, index|
      board_string << "#{rank}|"
      Board::FILES.each do |file|
        piece = board.find_piece_by_position("#{file}#{rank}")
        board_string << (piece ? unicode_character_for_piece([piece.color[0], piece.short_name].join) : '  ')
      end
      board_string << "|\n"
    end
    board_string << "  " + FILE_LETTERS.join(' ')
    board_string
  end

  def unicode_character_for_piece(input_string)
    "#{@unicode_dict.char_for_piece(input_string).encode(ENCODING)} "
  end
end
