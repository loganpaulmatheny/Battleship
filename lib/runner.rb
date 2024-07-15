
require_relative 'ship'
require_relative 'cell'
require_relative 'board'
require_relative 'commands'
require_relative 'player'
require_relative 'turn'


puts "Welcome to ⚓️ BATTLESHIP 🏴‍☠️"
# loop do 
puts "Enter p to play. Enter q to quit."
input = gets.chomp.downcase
  if input == 'p'
    puts "Starting your game"
    computer = Player.new
    computer_board = Board.new
    computer_ship = Ship.new("ai's Frigate", 3)
    computer_board.place_ship_random(computer_ship)
    puts "I have laid out my ships on the grid. You now need to lay out one ship. The Cruiser is three units."
    puts "This is what the board looks like."
    player = Player.new
    player_board = Board.new
    player_board.render
    player_cruiser = Ship.new("Le Player", 3)
    player_sub = Ship.new("Le Player Blue", 2)
    # puts player_board.inspect
    # randomly assign computer ships to their board (board class)
    player_cruiser_placed = false
    until player_cruiser_placed
      puts "Please enter squares for your Cruiser (3 spaces) separated by commas (e.g 'A1, B1, C1')"
      player_input = gets.chop.upcase
      player_coordinates = Commands.process_ship_coordinates(player_input)
      # puts player_coordinates.inspect
      # puts player_coordinates.class
      if player_board.place(player_cruiser, player_coordinates) 
        puts "Your cruiser has been placed!"
        player_cruiser_placed = true
      else 
        puts "That wasn't quite right, try entering different coordinates."
      end
    end 
    player_sub_placed = false
    until player_sub_placed
      puts "Please enter squares for your Sub (2 spaces) again, separated by commas"
      player_input = gets.chop.upcase
      player_coordinates = Commands.process_ship_coordinates(player_input)
      # puts player_coordinates.inspect
      # puts player_coordinates.class
      if player_board.place(player_sub, player_coordinates) 
        puts "Your Sub has been placed!"
        player_sub_placed = true
      else 
        puts "That wasn't quite right, try entering different coordinates."
      end
    end
   # Here's where I want to run a turn
    turn = Turn.new(player_board, computer_board, player, computer)
    computer_board.render(true) 
    turn.execute
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
