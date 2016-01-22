class UnicodeChess
  CHARACTERS = { "wP" => "\u2659",
                 "wC" => "\u2656",
                 "wN" => "\u2658",
                 "wB" => "\u2657",
                 "wK" => "\u2654",
                 "wQ" => "\u2655",
                 "bP" => "\u265F",
                 "bC" => "\u265C",
                 "bN" => "\u265E",
                 "bB" => "\u265D",
                 "bK" => "\u265A",
                 "bQ" => "\u265B"
               }

  def char_for_piece(input_string)
    CHARACTERS[input_string]
  end
end