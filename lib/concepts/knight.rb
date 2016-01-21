class Knight < Piece
  def possible_moves
    moves = Set.new
    x = HOR_POS.index_of(@positon[0])
    y = @position[1]

    (-2..2).step(2).each do |move_one|
      (-1..1).each do |move_two|
        move =  "#{self.rank + move_one} #{self.file + move_two}"
                "#{self.rank + move_one} #{self.file - move_two}"
        moves.add()
      end
    end
  end

  def illegal?
    return
  end
end
