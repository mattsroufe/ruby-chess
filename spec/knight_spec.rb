require 'spec_helper'

describe 'Knight' do
  describe '#possible_moves' do
    context 'from the initial position' do
      it 'returns only three possible moves from g1' do
        expect(Knight.new("black", "g1").possible_moves.length).to eq 3
      end

      it 'returns only three possible moves from g2' do
        expect(Knight.new("g2").possible_moves.length).to eq 4
      end

      it 'returns only three possible moves from g3' do
        expect(Knight.new("g3").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g4' do
        expect(Knight.new("g4").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g5' do
        expect(Knight.new("g5").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g6' do
        expect(Knight.new("g6").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g7' do
        expect(Knight.new("g7").possible_moves.length).to eq 4
      end

      it 'returns only three possible moves from g8' do
        expect(Knight.new("g8").possible_moves.length).to eq 3
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

      it 'returns eight possible moves from c5' do
        expect(Knight.new("c5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from d5' do
        expect(Knight.new("d5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from e5' do
        expect(Knight.new("e5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from f5' do
        expect(Knight.new("f5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from b5' do
        expect(Knight.new("b5").possible_moves.length).to eq 6
      end

      it 'returns eight possible moves from g5' do
        expect(Knight.new("g5").possible_moves.length).to eq 6
      end

      it 'returns eight possible moves from h5' do
        expect(Knight.new("h5").possible_moves.length).to eq 4
      end

      it 'returns eight possible moves from h3' do
        expect(Knight.new("h3").possible_moves.length).to eq 4
      end

      it 'returns eight possible moves from a5' do
        expect(Knight.new("a5").possible_moves.length).to eq 4
      end
    end
  end
end
