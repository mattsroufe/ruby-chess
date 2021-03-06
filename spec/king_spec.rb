require 'spec_helper'

describe King do
  let(:board) { Board.new }

  describe "#possible_moves" do
    it "returns the possible moves" do
      expect(King.new(board, :white, "a1").possible_moves).to match_array(%w[a2 b1 b2])
      expect(King.new(board, :white, "e5").possible_moves).to match_array(%w[d4 d5 d6 e4 e6 f4 f5 f6])
    end
  end
end
