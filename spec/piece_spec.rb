require 'spec_helper'

describe Piece do
  let(:board) { Board.new }
  let(:piece) { Piece.new(board, :white, "a1") }

  describe "#rank" do
    it "returns the rank" do
      expect(piece.rank).to eq(1)
    end
  end

  describe "#file" do
    it "returns the file" do
      expect(piece.file).to eq("a")
    end
  end
end
