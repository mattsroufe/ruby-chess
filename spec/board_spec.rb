require 'spec_helper'

describe Board do
  subject(:board) { Board.new }

  def print(board)
    board_string = ""
    Board::RANKS.reverse.each do |rank|
      board_string << "| "
      Board::FILES.each do |file|
        piece = board.find_piece_by_position("#{file}#{rank}")
        board_string << (piece ? [piece.color[0], piece.short_name, ' '].join : '   ')
      end
      board_string << "|\n"
    end
    board_string
  end

  describe "#new" do
    it "works" do
      expect(print(board)).to eq <<-eos
| bC bN bB bK bQ bB bN bC |
| bP bP bP bP bP bP bP bP |
|                         |
|                         |
|                         |
|                         |
| wP wP wP wP wP wP wP wP |
| wC wN wB wK wQ wB wN wC |
eos
      expect(board.find_piece_by_position('e2').possible_moves).to match_array(['e3', 'e4'])
      board.move(:white, 'e4')
      board.move(:black, 'd5')
      expect(print(board)).to eq <<-eos
| bC bN bB bK bQ bB bN bC |
| bP bP bP    bP bP bP bP |
|                         |
|          bP             |
|             wP          |
|                         |
| wP wP wP wP    wP wP wP |
| wC wN wB wK wQ wB wN wC |
eos
      expect(board.find_piece_by_position('e4').possible_moves).to match_array(['d5', 'e5'])
      board.move(:white, 'exd5')
      expect(print(board)).to eq <<-eos
| bC bN bB bK bQ bB bN bC |
| bP bP bP    bP bP bP bP |
|                         |
|          wP             |
|                         |
|                         |
| wP wP wP wP    wP wP wP |
| wC wN wB wK wQ wB wN wC |
eos
#       board.move(:black, 'exd4')
#       board.move(:white, 'Nf3')
#       board.move(:black, 'Nc6')
#       board.move(:white, 'Nxd4')
#       expect(print(board)).to eq <<-eos
# | bC    bB bK bQ bB bN bC |
# | bP bP bP bP    bP bP bP |
# |       bN                |
# |                         |
# |          wN wP          |
# |                         |
# | wP wP wP       wP wP wP |
# | wC wN wB wK wQ wB    wC |
# eos
    end
  end

  describe "#pieces" do
    it "returns the pieces" do
      expect(subject.pieces.count).to eq(32)
    end
  end

  describe "#move" do
    it "moves the piece to the new position" do
      expect(board.find_piece_by_position('e2')).to be_a Pawn
      expect(board.find_piece_by_position('e4')).to be_nil

      board.move(:white, 'e4')

      expect(board.find_piece_by_position('e2')).to be_nil
      expect(board.find_piece_by_position('e4')).to be_a Pawn
    end
  end

  describe "#find_piece_by_position" do
    it "finds the piece at the given position" do
      expect(board.find_piece_by_position('e2')).to be_a Pawn
    end
  end

  describe "#empty?" do
    it "returns whether the position is empty or not" do
      expect(board.empty?('e2')).to eq false
    end
  end

  describe "#remove" do
    it "removes the piece from the board" do
      expect { board.remove('e2') }.to change { board.pieces.count }.by(-1)
    end
  end
end
