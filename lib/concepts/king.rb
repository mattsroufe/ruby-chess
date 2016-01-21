class King < Piece
  def possible_moves
    moves = []
    idx = Board::FILES.index(file) + 1
    possible_files = [file]
    possible_files << file.next if Board::FILES.include?(file.next)
    possible_files << Board::FILES[idx - 2] if idx > 1
    possible_ranks = [rank]
    possible_ranks << rank + 1 if Board::RANKS.include?(rank + 1)
    possible_ranks << rank - 1 if Board::RANKS.include?(rank - 1)

    possible_files.each do |possible_file|
      possible_ranks.each do |possible_rank|
        moves << [possible_file, possible_rank].join
      end
    end

    moves.uniq - [position]
  end
end
