require 'spec_helper'

describe Move do
  describe "#valid?" do
    context "not a Pawn" do
      it "returns false" do
        pieces = [Bishop.new("a1")]
        piece = pieces.first
        new_position = "e1"
        expect(Move.new(pieces, piece, new_position).valid?).to eq(false)
      end
    end

    context "Pawn" do
      it "returns true" do
        pieces = [Pawn.new("a1")]
        pawn = pieces.first
        new_position = "e1"
        expect(Move.new(pieces, pawn, new_position).valid?).to eq(true)
      end
    end
  end
end
