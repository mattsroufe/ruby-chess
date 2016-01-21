require 'spec_helper'

describe Board do
  subject(:board) { Board.new }

  def printed_board(board)
    board_string = ""
    Board::RANKS.reverse.each do |rank|
      arr = []
      Board::FILES.each do |file|
        piece = board.pieces.find { |piece| piece.position == [file, rank].join }
        arr << (piece ? [piece.color[0], piece.short_name].join : '  ')
      end
      board_string << "| " + arr.join(' ') + " |\n"
    end
    board_string
  end

  describe "#new" do
    it "initializes a board with the pieces positioned correctly" do
      expect(printed_board(board)).to eq <<-eos
| bC bN bB bK bQ bB bN bC |
| bP bP bP bP bP bP bP bP |
|                         |
|                         |
|                         |
|                         |
| wP wP wP wP wP wP wP wP |
| wC wN wB wK wQ wB wN wC |
eos
      expect(printed_board(Board.new("e4", "e5", "d4"))).to eq <<-eos
| bC bN bB bK bQ bB bN bC |
| bP bP bP bP    bP bP bP |
|                         |
|             bP          |
|          wP wP          |
|                         |
| wP wP wP       wP wP wP |
| wC wN wB wK wQ wB wN wC |
eos
    end
  end

  describe "#pieces" do
    it "returns the pieces" do
      expect(subject.pieces.count).to eq(32)
    end
  end
end
