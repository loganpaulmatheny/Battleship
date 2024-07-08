require_relative 'commands'

class Turn 
  def initialize(player_board, computer_board, player, computer)
    @player_board = player_board
    @computer_board = computer_board
    @player = player
    @computer = computer
  end 

  def display_boards 
    puts "======PLAYER BOARD======"
    @player_board.render
    puts "======COMPUTER BOARD======"
    @computer_board.render
  end 
  
  # Ask the player for a shot
  def player_turn 
    player_input = Commands.choose_coordinates     
    guess_status = Commands.check_guess(player, player_input) 
    if guess_status == true 
     puts "We haven't guessed that before"
     @computer_board.cells[player_input].fire_upon
     puts  @computer_board.cells[player_input]
    else 
      puts "something's not quite right" 
    end
    @computer_board.render
  end 
  # Computer chooses a shot
  def computer_turn
    # More complicated, choose a random shot on the player's board that hasn't been guessed previously
    # Maybe I should store the guesses into a class
  end 
 
  # Results displayed

  def execute 
    display_boards
    player_turn
    puts @player

  end
end 
