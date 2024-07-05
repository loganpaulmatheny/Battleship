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

  describe '#valid_placement?' do 
    it 'should validate \'good\' coordinates given to place a ship both via row and column' do 
      board = Board.new
      ship = Ship.new("Cruiser", 3)
      sub = Ship.new("Submarine", 2)
      good_placement = board.valid_placement?(ship, ["A1","A2","A3"])
      sub_good_placement = board.valid_placement?(sub, ["C1", "D1"])
      expect(good_placement).to eq(true)
      expect(sub_good_placement).to eq(true)
    end 
  end 

  describe '#valid_placement?' do 
    it 'should not validate \'bad\' coordinates given to place a ship via row, column, and diagonally' do 
      board = Board.new
      ship = Ship.new("Cruiser", 3)
      sub = Ship.new("Submarine", 2)
      ship_bad_placement = board.valid_placement?(ship, ["A1","A4","A3"])
      sub_bad_placement = board.valid_placement?(sub, ["C1", "E1"])
      sub_bad_placement2 = board.valid_placement?(sub, ["C1", "D1", "E1"])
      diagonal_placement = board.valid_placement?(ship, ["A1", "B2", "C3"])
      expect(ship_bad_placement).to eq(false)
      expect(sub_bad_placement).to eq(false)
      expect(sub_bad_placement2).to eq(false)
      expect(diagonal_placement).to eq(false)
    end 
  end 

  describe '#valid_placement?' do 
    it 'should not allow overlaps' do 
      board = Board.new
      ship = Ship.new("Cruiser", 3)
      sub = Ship.new("Submarine", 2)
      board.place(ship, ["A1","A2","A3"])
      sub_overlap_placement = board.valid_placement?(sub, ["A1", "A2"])
      expect(sub_overlap_placement).to eq(false)
    end 
  end 

  # no test for capturing the stdout, use runner file

  # Create good and bad path tests that show you can randomly place ship

  describe '#place_ship_random' do 
    let(:board) { Board.new}
    let(:ship) { double("Ship", length: 3)} # mocking the object as to not introduce additional dependencies
    
    context 'with valid placements' do 
      it 'places the ships randomly within the board' do 
        expect(board).to receive(:place).with(ship, instance_of(Array))
        expect(board.place_ship_random(ship)).to be true
      end
    end 

    context 'with invalid placements' do 
      before do 
        allow(board).to receive(:valid_placement?).and_return(false, true)
      end 

      it 'places the ships randomly within the board' do 
        expect(board).to receive(:place).with(ship, instance_of(Array))
        expect(board.place_ship_random(ship)).to be true
      end
    end 
  end
end