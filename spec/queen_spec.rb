require 'spec_helper'

describe Queen do
  describe "#possible_moves" do
    it "returns the possible moves" do
      expect(Queen.new("black", "a1").possible_moves).to match_array(%w[a2 a3 a4 a5 a6 a7 a8 b1 b2 c1 c3 d1 d4 e1 e5 f1 f6 g1 g7 h1 h8])
      expect(Queen.new("black", "e5").possible_moves).to match_array(%w[a1 a5 b2 b5 b8 c3 c5 c7 d4 d5 d6 e1 e2 e3 e4 e6 e7 e8 f4 f5 f6 g3 g5 g7 h2 h5 h8])
    end
  end
end
