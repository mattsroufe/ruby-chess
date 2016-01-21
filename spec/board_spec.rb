require 'spec_helper'

describe Board do
  subject(:board) { Board.new }

  def printed_board(board)
    board_string = ""
    Board::RANKS.reverse.each do |rank|
      board_string << "| "
      Board::FILES.each do |file|
        piece = board.pieces.find { |piece| piece.position == [file, rank].join }
        board_string << (piece ? [piece.color[0], piece.short_name, ' '].join : '   ')
      end
      board_string << "|\n"
    end
    board_string
  end

  describe "#new" do
    context "with no pieces passed in" do
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
      end
    end

    context "with pieces passed in" do
      it "sets up board properly" do
        board = Board.new
        board.move(:white, 'e4')
        expect(printed_board(Board.new(board.pieces))).to eq <<-eos
| bC bN bB bK bQ bB bN bC |
| bP bP bP bP bP bP bP bP |
|                         |
|                         |
|             wP          |
|                         |
| wP wP wP wP    wP wP wP |
| wC wN wB wK wQ wB wN wC |
eos
      end
    end
  end

  describe "#pieces" do
    it "returns the pieces" do
      expect(subject.pieces.count).to eq(32)
    end
  end

  describe "#move" do
    it "moves the piece to the new position" do
      expect(board.pieces['e2']).to be_a Pawn
      expect(board.pieces['e4']).to be_nil

      board.move(:white, 'e4')

      expect(board.pieces['e2']).to be_nil
      expect(board.pieces['e4']).to be_a Pawn
    end
  end

  describe "#find_piece_by_position" do
    it "finds the piece at the given position" do
      expect(board.find_piece_by_position('e2')).to be_a Pawn
    end
  end
end
