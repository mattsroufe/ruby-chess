require 'spec_helper'

describe Board do
  subject(:board) { Board.new }

  def printed_board
    str = ""
    Board::RANKS.reverse.each do |rank|
      arr = []
      Board::FILES.each do |file|
        piece = subject.pieces.find { |piece| piece.position == [file, rank].join }
        arr << (piece ? [piece.color[0], piece.short_name].join : '  ')
      end
      str << "| " + arr.join(' | ') + " |\n"
      str << "-----------------------------------------\n" unless rank == 1
    end
    str
  end

  describe "#new" do
    it "works" do
      expect(printed_board).to eq <<-eos
| bC | bN | bB | bK | bQ | bB | bN | bC |
-----------------------------------------
| bP | bP | bP | bP | bP | bP | bP | bP |
-----------------------------------------
|    |    |    |    |    |    |    |    |
-----------------------------------------
|    |    |    |    |    |    |    |    |
-----------------------------------------
|    |    |    |    |    |    |    |    |
-----------------------------------------
|    |    |    |    |    |    |    |    |
-----------------------------------------
| wP | wP | wP | wP | wP | wP | wP | wP |
-----------------------------------------
| wC | wN | wB | wK | wQ | wB | wN | wC |
eos
    end
  end

  describe "#pieces" do
    it "returns the pieces" do
      expect(subject.pieces.count).to eq(32)
    end
  end
end
