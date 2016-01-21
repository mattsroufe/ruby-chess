require 'spec_helper'

describe 'Knight' do
  describe '#possible_moves' do
    context 'from the initial position' do
      it 'returns only three possible moves from g1' do
        expect(Knight.new("black", "g1").possible_moves.length).to eq 3
      end
      it 'returns only three possible moves from b1' do
        expect(Knight.new("black", "b1").possible_moves.length).to eq 3
      end
      it 'returns only three possible moves from g8' do
        expect(Knight.new("black", "g8").possible_moves.length).to eq 3
      end
      it 'returns only three possible moves from b8' do
        expect(Knight.new("black", "b8").possible_moves.length).to eq 3
      end
    end
  end
end
