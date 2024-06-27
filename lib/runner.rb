require './lib/ship'
require './lib/cell'
require './lib/board'

puts "Welcome to ⚓️ BATTLESHIP 🏴‍☠️"
# loop do 
  puts "Enter p to play. Enter q to quit."
  input = gets.chomp.downcase
  if input == 'p'
    puts "Starting your game"
    computer_board = Board.new
    cells = computer_board.cells.keys
    # randomly assign computer ships to their board
  elsif input == "q"
    puts "Quitting the game!"
  else
    puts "Invalid input. Please enter 'p' to play or 'q' to quit."
  end
# end 
# board = Board.new
# ship = Ship.new("Cruiser", 3)
# sub = Ship.new("Submarine", 2)
# board.place(ship,["A1","A2","A3"])
# # cell.place_ship(ship)
# # board.valid_placement?(ship, ["A1","A2","A3"])
# # cell.fire_upon
# # cell.fire_upon
# # cell.fire_upon
# board.render(true)

require 'pry'; binding.pry