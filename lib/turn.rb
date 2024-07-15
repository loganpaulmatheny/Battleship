require_relative 'commands'
require_relative 'player'

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
   # Need to also make sure that the coordinate is a valid coordinate 
    if  Commands.check_guess(@player, player_input) && Commands.validate_coordinate(@computer_board, player_input) 
      player_guess = @computer_board.cells[player_input]
      player_guess.fire_upon
      @player.guesses.push(player_input)
      if player_guess.ship && player_guess.ship.sunk?
        @computer.ship_sunk
      end
      return player_guess
    else 
      player_turn 
    end
  end 
  
  def computer_turn
    random_cell = @player_board.cells.keys.sample
    if Commands.check_guess(@computer, random_cell) && Commands.validate_coordinate(@player_board, random_cell) 
      computer_guess = @player_board.cells[random_cell]
      computer_guess.fire_upon
      @computer.guesses.push(random_cell)
      if computer_guess.ship && computer_guess.ship.sunk?
        @player.ship_sunk
      end
      return computer_guess
    else 
      computer_turn
    end    
  end 

  def render_guess_status(guess, cell)
    if guess == "M"
      return "is a miss"
    elsif guess == "H"
      return "is a hit"
    elsif guess ==  "X"
      return "is a hit and you sunk a #{render_sunk_ship(cell)}"
    end 
   end 
 
  def render_sunk_ship(cell)
    if cell.ship.sunk? 
      return cell.ship.name
    else 
      return null
    end  
  end 
  
  def display_results(player_guess, computer_guess)
    puts "The players guess of #{player_guess.cell }  #{render_guess_status(player_guess.render, player_guess)}"
    puts "The computer' guess of #{computer_guess.cell} #{render_guess_status(computer_guess.render, computer_guess)}" 
  end

  def execute 
    display_boards
    until game_over?
      player_move = player_turn
      computer_move = computer_turn
      display_results(player_move, computer_move)
    end
    puts "Game over"
    if @player.ships_remaining > 0
      puts "Player wins!!"
    else 
      puts "Computer wins!"
    end
  end

  def game_over?
    @player.ships_remaining == 0  || @computer.ships_remaining == 0 
  end 

end 
