require 'spec_helper'

describe 'Knight' do
  describe '#possible_moves' do
    context 'from the initial position' do
      let(:knight) { Knight.new("black", "g1") }

      it 'returns only three possible moves from g1' do
        expect(knight.possible_moves.length).to eq 3
        expect(knight.possible_moves).to eq ["e2", "h3", "f3"]
      end

      it 'returns only three possible moves from g2' do
        expect(Knight.new(:black, "g2").possible_moves.length).to eq 4
      end

      it 'returns only three possible moves from g3' do
        expect(Knight.new(:black, "g3").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g4' do
        expect(Knight.new(:black, "g4").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g5' do
        expect(Knight.new(:black, "g5").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g6' do
        expect(Knight.new(:black, "g6").possible_moves.length).to eq 6
      end

      it 'returns only three possible moves from g7' do
        expect(Knight.new(:black, "g7").possible_moves.length).to eq 4
      end

      it 'returns only three possible moves from g8' do
        expect(Knight.new(:black, "g8").possible_moves.length).to eq 3
      end

      it 'returns only three possible moves from b1' do
        expect(Knight.new(:black, "b1").possible_moves.length).to eq 3
      end

      it 'returns only three possible moves from g8' do
        expect(Knight.new(:black, "g8").possible_moves.length).to eq 3
      end

      it 'returns only three possible moves from b8' do
        expect(Knight.new(:black, "b8").possible_moves.length).to eq 3
      end

      it 'returns eight possible moves from c5' do
        expect(Knight.new(:black, "c5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from d5' do
        expect(Knight.new(:black, "d5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from e5' do
        expect(Knight.new(:black, "e5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from f5' do
        expect(Knight.new(:black, "f5").possible_moves.length).to eq 8
      end

      it 'returns eight possible moves from b5' do
        expect(Knight.new(:black, "b5").possible_moves.length).to eq 6
      end

      it 'returns eight possible moves from g5' do
        expect(Knight.new(:black, "g5").possible_moves.length).to eq 6
      end

      it 'returns eight possible moves from h5' do
        expect(Knight.new(:black, "h5").possible_moves.length).to eq 4
      end

      it 'returns eight possible moves from h3' do
        expect(Knight.new(:black, "h3").possible_moves.length).to eq 4
      end

      it 'returns eight possible moves from a5' do
        expect(Knight.new(:black, "a5").possible_moves.length).to eq 4
      end
    end
  end
end
