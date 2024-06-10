require './lib/ship'
require './lib/cell'
require './lib/board'

board = Board.new
cell = Cell.new("B4")
ship = Ship.new("Cruiser", 3)
sub = Ship.new("Submarine", 2)
# cell.place_ship(ship)
board.valid_placement?(ship, ["A1","A2","A3"])
# cell.fire_upon
# cell.fire_upon
# cell.fire_upon

require 'pry'; binding.pry