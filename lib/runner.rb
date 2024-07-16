
require_relative 'ship'
require_relative 'cell'
require_relative 'board'
require_relative 'commands'
require_relative 'player'
require_relative 'turn'

def welcome_message
  puts "Welcome to ⚓️ BATTLESHIP 🏴‍☠️"
end

def prompt_user
  puts "Enter p to play. Enter q to quit."
  input = gets.chomp.downcase
end

def setup_computer
  computer = Player.new
  computer_board = Board.new
  computer_ship = Ship.new("ai's Frigate", 3)
  computer_board.place_ship_random(computer_ship)
  [computer, computer_board]
end

def setup_player
  player = Player.new
  player_board = Board.new
  player_board.render
  [player, player_board]
end

def place_ship(player_board, ship, instructions)
  ship_placed = false
  until ship_placed
    puts instructions
    player_input = gets.chop.upcase
    player_coordinates = Commands.process_ship_coordinates(player_input)
    if player_board.place(ship, player_coordinates) 
      puts "Your #{ship.name} has been placed!"
      ship_placed = true
    else 
      puts "That wasn't quite right, try entering different coordinates."
    end
  end
end 

def play_game
  puts "Starting the game"
  computer, computer_board = setup_computer
  player, player_board = setup_player
  puts "I have laid out my ships on the grid. You now need to lay out one ship. The Cruiser is three units."

  cruiser = Ship.new("Le Player Cruiser", 3)
  sub = Ship.new("Le Player Sub", 2) 

  place_ship(player_board, cruiser, "Please enter squares for your Cruiser (3 spaces) separated by commas (e.g 'A1, B1, C1')")
  place_ship(player_board, sub, "Please enter squares for your Sub (2 spaces) separated by commas (e.g 'A1, B1')")

  turn = Turn.new(player_board, computer_board, player, computer) 
  computer_board.render(true)
  turn.execute
end 

def run_game
  welcome_message 
  loop do 
    input = prompt_user
    case input 
    when "p"
      play_game
    when "q" 
      puts "Quitting game"
      break 
    else 
      puts "Invalid input, please type 'p' to play the game, or 'q' to quit the game"
    end
  end
end

run_game
