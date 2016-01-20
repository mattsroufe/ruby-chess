class StartGame
  POSITIONS = { 'white' => {
                  Pawn => a2,
                  Pawn => b2,
                  Pawn => c2,
                  Pawn => d2,
                  Pawn => e2,
                  Pawn => f2,
                  Pawn => g2,
                  Pawn => h2,
                  Castle => a1,
                  Knight => b1,
                  Bishop => c1,
                  King => d1,
                  Queen => e1,
                  Bishop => f1,
                  Knight => g1,
                  Castle => h1,
                  },
                'black' => {
                  Pawn => a7,
                  Pawn => b7,
                  Pawn => c7,
                  Pawn => d7,
                  Pawn => e7,
                  Pawn => f7,
                  Pawn => g7,
                  Pawn => h7,
                  Castle => a8,
                  Knight => b8,
                  Bishop => c8,
                  King => d8,
                  Queen => e8,
                  Bishop => f8,
                  Knight => g8,
                  Castle => h8,
                }
              }

  def call
    POSITIONS.map do |k, v|
      k.new(v)
    end
  end
end
