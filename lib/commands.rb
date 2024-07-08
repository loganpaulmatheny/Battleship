
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
    input = gets.chop.upcase 
  end 

  def self.check_guesses(player, guess)
    # I want to check and see if the coordinates is anywhere in the guessed list already
    if player.guesses.include?(guess)
      puts "You've already guessed that, try again"
      return false
    else
      puts "That's a good guess!"
      return true
    end  
  end 
end 
