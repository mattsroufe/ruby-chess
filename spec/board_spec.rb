require 'spec_helper'

describe Board do
  let(:game)      { Game.new }
  subject(:board) { game.board }

  describe "#new" do
    it "works" do
      expect(Board.new).to be_an_instance_of Board
    end
  end

  describe "#pieces" do
    it "returns the pieces" do
      expect(subject.pieces.count).to eq(2)
    end
  end
end
