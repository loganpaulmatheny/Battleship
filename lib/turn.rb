
class Turn 
  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end 

  def display_boards 
    puts "======PLAYER BOARD======"
    @player_board.render
    puts "======COMPUTER BOARD======"
    @computer_board.render
  end 

end 