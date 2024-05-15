require 'spec_helper'

RSpec.describe 'Cell' do 
  describe '#initialize' do 
    it 'should create a cell' do
      cell = Cell.new("B4")
      expect(cell).to be_a(Cell)
      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to eq(nil)
      expect(cell.empty?).to eq(true)
    end 
    it "can input a cell" do 
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end
  describe "#fired_upon" do 
    it 'should keep track if the cell has been fired upon'  do 
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      fired_upon = cell.fired_upon?
      expect(fired_upon).to eq(false)
    end 
  end 
  describe "#fired_upon" do 
    it 'should keep track if the cell has been fired upon'  do 
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      fired_upon = cell.fired_upon?
      expect(fired_upon).to eq(false)
    end 
  end 
  describe "#render" do 
    it 'should render the cell if there is a ship and required'  do 
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      render_ship = cell.render(true)
      expect(render_ship).to eq("S")
    end 
    it 'should show a miss if there is no ship present'  do 
      cell = Cell.new("B4")
      cell.fire_upon
      render_ship = cell.render
      expect(render_ship).to eq("M")
    end 
    it 'should show that there has been no shot fired if the cell has not been fired upon'  do 
      cell = Cell.new("B4")
      render_ship = cell.render
      expect(render_ship).to eq(".")
    end 
    it 'should show a hit if there is a ship and it has been fired upon'  do 
      cell = Cell.new("B4")
      ship = Ship.new("Cruiser", 3)
      cell.place_ship(ship)
      cell.fire_upon
      render_ship = cell.render
      expect(render_ship).to eq("H")
    end 
    # continue tests for if #render shows that a ship has been sunk
    it 'should show a hit if there is a ship and it has been fired upon'  do 
      cell = Cell.new("B4")
      ship = Ship.new("Cruiser", 3)
      cell.place_ship(ship)
      cell.fire_upon
      render_ship = cell.render
      expect(render_ship).to eq("H")
    end 
    # continue tests for if #render shows that a ship has been sunk
    it 'should show a hit if there is a ship and it has been fired upon'  do 
      cell = Cell.new("B4")
      ship = Ship.new("Cruiser", 3)
      cell.place_ship(ship)
      cell.fire_upon
      cell.fire_upon
      cell.fire_upon
      render_ship = cell.render
      expect(render_ship).to eq("X")
    end 
  end 
end