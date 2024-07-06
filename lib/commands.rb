
class Commands

  def process_ship_coordinates(input)
    # I want to take in a string and loop through it ensuring that the splits are turned into an array 
    input = remove_spaces(input)
    coordinates = input.split(",", 0)
    return coordinates
  end 
  
  def remove_spaces(input)
    input = input.gsub(" ", "")
  end 

end 