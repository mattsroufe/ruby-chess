require 'spec_helper'

describe Board do
  describe "#new" do
    it "works" do
      expect(Board.new).to be_an_instance_of  Board
    end
  end
end
