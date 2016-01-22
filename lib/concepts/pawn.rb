class Pawn < Piece
  attr_reader :initial_position

  def initialize(board, color, position)
    super(board, color, position)
    @initial_position = position
  end

  def possible_moves
    moves = []
    file = Piece::HOR_POS.index(self.position[0])
    rank = self.position[1].to_i

    self.color = :white ? direction = 1 : direction = -1

    moves << "#{Piece::HOR_POS[file]}#{rank + (direction * 2)}" unless self.position != self.initial_position
    moves << "#{Piece::HOR_POS[file]}#{rank + direction}"
    moves << "#{Piece::HOR_POS[file - 1]}#{rank + direction}" unless invalid_file?(file - 1)
    moves << "#{Piece::HOR_POS[file + 1]}#{rank + direction}" unless invalid_file?(file + 1)

    moves
  end

  def invalid_file?(file)
    file < 0 || !(1..9).include?(file) || Piece::HOR_POS[file + 1].nil?
  end
end
