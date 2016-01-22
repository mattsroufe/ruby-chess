class UnicodeChess
  CHARACTERS = { "bP" => "\u2659",
                 "bC" => "\u2656",
                 "bN" => "\u2658",
                 "bB" => "\u2657",
                 "bK" => "\u2654",
                 "bQ" => "\u2655",
                 "wP" => "\u265F",
                 "wC" => "\u265C",
                 "wN" => "\u265E",
                 "wB" => "\u265D",
                 "wK" => "\u265A",
                 "wQ" => "\u265B"
               }

  def char_for_piece(input_string)
    CHARACTERS[input_string]
  end
end
