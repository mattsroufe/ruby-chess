require 'Set'

class Knight < Piece
  def possible_moves
    moves = Set.new
    file = Piece::HOR_POS.index(self.position[0]) + 1
    rank = self.position[1].to_i

    moves.add("#{Piece::HOR_POS[(file + 2) - 1]}#{rank + 1}") unless invalid_file?((file + 2) - 1)
    moves.add("#{Piece::HOR_POS[(file + 2) - 1]}#{rank - 1}") unless invalid_file?((file + 2) - 1)
    moves.add("#{Piece::HOR_POS[(file - 2) - 1]}#{rank + 1}") unless invalid_file?((file - 2) - 1)
    moves.add("#{Piece::HOR_POS[(file - 2) - 1]}#{rank - 1}") unless invalid_file?((file - 2) - 1)
    moves.add("#{Piece::HOR_POS[(file + 1) - 1]}#{rank + 2}") unless invalid_file?(file + 1)
    moves.add("#{Piece::HOR_POS[(file + 1) - 1]}#{rank - 2}") unless invalid_file?(file + 1)
    moves.add("#{Piece::HOR_POS[(file - 1) - 1]}#{rank + 2}") unless invalid_file?(file - 1)
    moves.add("#{Piece::HOR_POS[(file - 1) - 1]}#{rank - 2}") unless invalid_file?(file - 1)

    moves.reject! { |move| move.length != 2 }
    valid_moves(moves.to_a)
  end

  def invalid_file?(file)
    file < 0
  end

  def valid_moves(all_possible_moves)
    all_possible_moves.reject! { |move| move[1].to_i == self.rank }
    all_possible_moves.reject! { |move| move[0] == self.file }
    all_possible_moves.select! { |move| ("a".."h").include?(move[0]) && (1..8).include?(move[1].to_i) }
    all_possible_moves
  end
end
