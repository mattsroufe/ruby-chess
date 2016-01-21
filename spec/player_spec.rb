require 'spec_helper'

describe Player do
  subject(:player) { Player.new }

  describe "#new" do
    it "creates a new player" do
      expect(player).to be_an_instance_of Player
    end
  end

  describe "#pieces" do
    it "returns the players pieces" do
      expect(player.pieces).to eq([])
    end
  end

  describe "#moves" do
    it "returns the players moves" do
      expect(player.moves).to eq([])
    end
  end
end
