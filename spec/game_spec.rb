require 'spec_helper'

describe Game do
  subject(:game) { Game.new }

  describe "#new" do
    it "works" do
      expect(game).to be_an_instance_of Game
    end
  end

  describe "#board" do
    it "returns the board" do
      expect(game.board).to be_an_instance_of Board
    end
  end

  describe "#players" do
    it "returns the players" do
      expect(game.players.count).to eq(2)
    end
  end

  describe "#player_one" do
    it "returns the first player" do
      expect(game.player_one).to eq(game.players.first)
    end
  end

  describe "#player_two" do
    it "returns the second player" do
      expect(game.player_two).to eq(game.players.last)
    end
  end
end
