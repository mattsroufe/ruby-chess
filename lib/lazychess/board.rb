class Board
  attr_reader :pieces

  RANKS = (1..8).to_a
  FILES = ('a'..'h').to_a

  WHITE_POSITIONS = [
    'Pawn   a2',
    'Pawn   b2',
    'Pawn   c2',
    'Pawn   d2',
    'Pawn   e2',
    'Pawn   f2',
    'Pawn   g2',
    'Pawn   h2',
    'Castle a1',
    'Knight b1',
    'Bishop c1',
    'King   d1',
    'Queen  e1',
    'Bishop f1',
    'Knight g1',
    'Castle h1'
  ]

  BLACK_POSITIONS = [
    'Pawn   a7',
    'Pawn   b7',
    'Pawn   c7',
    'Pawn   d7',
    'Pawn   e7',
    'Pawn   f7',
    'Pawn   g7',
    'Pawn   h7',
    'Castle a8',
    'Knight b8',
    'Bishop c8',
    'King   d8',
    'Queen  e8',
    'Bishop f8',
    'Knight g8',
    'Castle h8'
  ]

  def initialize(pieces = {})
    @pieces = pieces

    if pieces.empty?
      WHITE_POSITIONS.each do |piece_position|
        piece, position = piece_position.split(' ')
        color = :white
        @pieces[position] = Object.const_get(piece).new(color, position)
      end

      BLACK_POSITIONS.each do |piece_position|
        piece, position = piece_position.split(' ')
        color = :black
        @pieces[position] = Object.const_get(piece).new(color, position)
      end
    end

    # Array(history).each_slice(2) do |turns|
    #   turns.each_with_index do |recorded_move, i|
    #     color = i == 0 ? :white : :black
    #     if recorded_move.length == 2
    #       piece = pieces.find { |piece| piece.is_a?(Pawn) && piece.color == color && piece.file == recorded_move[0] }
    #       piece.position = recorded_move
    #     end
    #   end
    # end
  end

  def move(color, notation)
    if recorded_move.length == 2
      piece = pieces.notation[0]
    end

    pieces[to] = pieces.delete(from)
  end
end
