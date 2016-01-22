require 'spec_helper'

describe Bishop do
  let(:board) { Board.new([]) }

  describe "#possible_moves" do
    it "returns the possible moves" do
      expect(Bishop.new(board, :white, "c1").possible_moves).to eq(%w[a3 b2 d2 e3 f4 g5 h6])
      expect(Bishop.new(board, :white, "e5").possible_moves).to eq(%w[a1 b2 b8 c3 c7 d4 d6 f4 f6 g3 g7 h2 h8])
    end
  end
end
