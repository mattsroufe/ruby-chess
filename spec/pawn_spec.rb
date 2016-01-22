require 'spec_helper'

describe 'Pawn' do
  let(:board) { Board.new }

  context 'the white player' do

    context 'makes the first of the game' do
      let(:pawn) { Pawn.new(board, :white, 'c2') }

      it 'it returns four possible moves' do
        expect(pawn.possible_moves.length).to eq 4
        expect(pawn.possible_moves).to eq ["c4", "c3", "b3", "d3"]
      end
    end

    context 'makes a move after having moved at least once' do
      let(:pawn) { Pawn.new(board, :white, 'c2') }

      it 'it returns three possible moves from c3' do
        allow(pawn).to receive(:position).and_return('c3')
        expect(pawn.possible_moves.length).to eq 3
      end

      it 'it returns two possible moves from a3' do
        allow(pawn).to receive(:position).and_return('a3')
        expect(pawn.possible_moves.length).to eq 2
      end

      it 'it returns two possible moves from h3' do
        allow(pawn).to receive(:position).and_return('h3')
        expect(pawn.possible_moves.length).to eq 2
      end
    end
  end

  context 'the black player' do

    context 'makes the first of the game' do
      let(:pawn) { Pawn.new(board, :black, 'c7') }

      it 'it returns four possible moves' do
        expect(pawn.possible_moves.length).to eq 4
      end
    end

    context 'makes a move after having moved at least once' do
      let(:pawn) { Pawn.new(board, :white, 'c7') }

      it 'it returns three possible moves from c6' do
        allow(pawn).to receive(:position).and_return('c6')
        expect(pawn.possible_moves.length).to eq 3
      end

      it 'it returns two possible moves from a6' do
        allow(pawn).to receive(:position).and_return('a6')
        expect(pawn.possible_moves.length).to eq 2
      end
      
      it 'it returns two possible moves from h6' do
        allow(pawn).to receive(:position).and_return('h6')
        expect(pawn.possible_moves.length).to eq 2
      end
    end
  end
end
