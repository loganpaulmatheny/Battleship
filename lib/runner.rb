require './lib/ship'
require './lib/cell'
require './lib/board'

board = Board.new
ship = Ship.new("Cruiser", 3)
sub = Ship.new("Submarine", 2)
board.place(ship,["A1","A2","A3"])
# cell.place_ship(ship)
# board.valid_placement?(ship, ["A1","A2","A3"])
# cell.fire_upon
# cell.fire_upon
# cell.fire_upon
board.render(true)

require 'pry'; binding.pry