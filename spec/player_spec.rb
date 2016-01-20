require 'spec_helper'

describe Player do

  describe "#new" do
    it "creates a new player" do
      expect(Player.new).to be_an_instance_of Player
    end
  end
end
