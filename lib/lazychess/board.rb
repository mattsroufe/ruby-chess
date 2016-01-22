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

  def initialize(pieces = [])
    @pieces = pieces

    if pieces.empty?
      WHITE_POSITIONS.each do |piece_position|
        piece, position = piece_position.split(' ')
        color = :white
        @pieces << Object.const_get(piece).new(self, color, position)
      end

      BLACK_POSITIONS.each do |piece_position|
        piece, position = piece_position.split(' ')
        color = :black
        @pieces << Object.const_get(piece).new(self, color, position)
      end
    end
  end

  def move(color, notation)
    if pawn_move?(notation)
      pawn = pieces.find { |piece| piece.is_a?(Pawn) && piece.color == color && piece.file == notation[0] }

      if capture?(notation)
        position = notation.split('x').last
        remove(position)
        pawn.position = position
      else
        pawn.position = notation
      end
    elsif knight_move?(notation)
      if capture?(notation)
        position = notation.split('x').last
        knight = pieces.find { |piece| piece.is_a?(Knight) && piece.color == color && piece.possible_moves.include?(position) }
        remove(position)
        knight.position = position
      else
        position = notation[1..-1]
        knight = pieces.find { |piece| piece.is_a?(Knight) && piece.color == color && piece.possible_moves.include?(position) }
        knight.position = position
      end
    end
  end

  def find_piece_by_position(position)
    pieces.find { |piece| piece.position == position }
  end

  def empty?(position)
    !find_piece_by_position(position)
  end

  def remove(position)
    pieces.delete(find_piece_by_position(position))
  end

  private

  def pawn_move?(str)
    str[0] == str[0].downcase
  end

  def knight_move?(str)
    str[0] == "N"
  end

  def capture?(str)
    str.include?('x')
  end
end
