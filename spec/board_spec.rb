require 'spec_helper'

# we can assert what we do know about this hash. It’s a hash, it should have 16 key/value pairs, and those keys point to cell objects.

RSpec.describe 'Board' do 
  describe '#initialize' do 
    it 'should create a board (hash) with 16 cell objects within it' do
    board = Board.new
    cells = board.cells
    expect(cells).to be_a(Hash) 
    expect(cells.size).to eq(16)

    cells.values.each do |cell|
      expect(cell).to be_a(Cell)
    end 
    # run a loop to ensure that the cells are objects
    end 
  end
end