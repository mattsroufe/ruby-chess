require 'spec_helper'

describe Game do
  subject(:game) { Game.new }

  describe "#new" do
    it "works" do
      expect(subject).to be_an_instance_of Game
    end
  end

  describe "#board" do
    it "returns the board" do
      expect(subject.board).to be_an_instance_of Board
    end
  end
end
