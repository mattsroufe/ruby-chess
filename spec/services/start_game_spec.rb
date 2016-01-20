require_relative '../spec_helper'

describe StartGame do
  describe "#new" do
    it "works" do
      expect(StartGame.new).to be_an_instance_of StartGame
    end
  end
end
