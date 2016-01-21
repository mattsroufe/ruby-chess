require 'spec_helper'

describe Castle do
  describe "#new" do
    it "works" do
      expect(Castle.new("a1")).to be_an_instance_of Castle
    end
  end

  describe "#possible_moves" do
    it "returns the possible moves" do
      expect(Castle.new("a1").possible_moves).to match_array(%w[a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1])
      expect(Castle.new("e5").possible_moves).to match_array(%w[a5 b5 c5 d5 e1 e2 e3 e4 e6 e7 e8 f5 g5 h5])
    end
  end
end
