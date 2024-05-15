require './lib/ship'
require './lib/cell'

cell = Cell.new("B4")
ship = Ship.new("Cruiser", 3)
cell.place_ship(ship)
cell.fire_upon
cell.fire_upon
cell.fire_upon

require 'pry'; binding.pry