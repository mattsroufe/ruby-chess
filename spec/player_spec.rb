require 'spec_helper'

describe Player do
  let(:start_game) { StartGame.new }
  let(:game) { start_game.game }
  subject(:player) { game.player_one }

  before { start_game.call }

  describe "#new" do
    it "creates a new player" do
      expect(player).to be_an_instance_of Player
    end
  end

  describe "#pieces" do
    it "returns the players pieces" do
      expect(player.pieces.count).to eq(16)
    end
  end

  describe "#moves" do
    it "returns the players moves" do
      expect(player.moves).to eq([])
    end
  end

  describe "#move" do
    let(:old_position) { "e2" }
    let(:new_position) { "e4" }

    it "makes a move" do
      expect { player.move(new_position) }.to change { player.find_piece_at(old_position).position }.from(old_position).to(new_position)
    end
  end

  describe "#find_piece_at" do
    let(:position_with_pawn)     { "e2" }
    let(:position_without_piece) { "e4" }

    it "finds the piece at the position" do
      expect(player.find_piece_at(position_with_pawn).class).to eq(Pawn)
    end
  end
end
