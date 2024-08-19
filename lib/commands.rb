
class Commands

  def self.process_ship_coordinates(input)
    # I want to take in a string and loop through it ensuring that the splits are turned into an array 
    input = remove_spaces(input)
    coordinates = input.split(",", 0)
    return coordinates
  end 

  def self.remove_spaces(input)
    input = input.gsub(" ", "")
  end 


  def self.choose_coordinates
    puts 'Enter the coordinates for your shot.'
    input = gets.chomp.upcase 
  end 

  def self.check_guess(player, guess)
    guess = guess.strip.downcase
    normalized_guesses = player.guesses.map(&:strip).map(&:downcase)

    puts "Guess: #{guess}"
    puts "Normalized Guesses: #{normalized_guesses.inspect}"

    if normalized_guesses.include?(guess)  
      puts "You've already guessed that, try again"
      return false
    else
      return true
    end  
  end

  def self.validate_coordinate(board, coordinate)
    if board.cells.include?(coordinate) 
      true 
    else 
      "That coordinate is not on the board, try again"
      false
    end
  end

end 
