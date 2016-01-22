require 'spec_helper'

describe Move do
  let(:board)        { Board.new }
  let(:pieces)       { [Bishop.new(board, :white, "c1")] }
  let(:old_position) { "c1" }
  let(:new_position) { "e1" }

  describe "#new" do
    let(:old_position) { "a1" }

    it "raises an error if there is no piece in the old_position" do
      expect { Move.new(pieces, old_position, new_position) }.to raise_error Move::NoPieceError
    end
  end

  describe "#valid?" do
    context "when the new_position is not one of the pieces possible moves" do
      it "returns false" do
        expect(Move.new(pieces, old_position, new_position).valid?).to eq(false)
      end
    end
  end
end
