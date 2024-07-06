require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/commands'

puts "Welcome to ⚓️ BATTLESHIP 🏴‍☠️"
# loop do 
puts "Enter p to play. Enter q to quit."
commands = Commands.new
input = gets.chomp.downcase
  if input == 'p'
    puts "Starting your game"
    computer_board = Board.new
    computer_ship = Ship.new("ai's Frigate", 3)
    computer_cells = computer_board.place_ship_random(computer_ship)
    puts "I have laid out my ships on the grid. You now need to lay out one ship. The Cruiser is three units."
    puts "This is what the board looks like"
    player_board = Board.new
    player_board.render
    puts "Please enter squares for your Cruiser (3 spaces) and we'll begin (e.g 'A1, B1, C1')"
    # randomly assign computer ships to their board (board class)
    player_input = gets.chop.downcase
    player_coordinates = commands.process_ship_coordinates(player_input)
    puts player_coordinates.inspect
    
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

# require 'pry'; binding.pry