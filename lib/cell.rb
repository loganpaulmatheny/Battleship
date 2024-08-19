require_relative 'ship'

class Cell
  attr_reader :ship, :fired_upon, :cell

  def initialize(cell)
    @cell = cell
    @ship = nil
    @fired_upon = false
  end

  def coordinate 
    @cell
  end

  def ship
    @ship
  end

  def empty? 
    if @ship 
      false
    else 
      true
    end 
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    unless empty? 
      @ship.hit
      puts @ship.health
    end 
    @fired_upon = true
  end 

  def fired_upon?
    @fired_upon 
  end

# render method 
# ”.” if the cell has not been fired upon.
# “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
# “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
# “X” if the cell has been fired upon and its ship has been sunk.
# boolean as well e.g. cell_2.render(true) shows "S"
## How can one create an argument that is optional? 
## The first if statement is triggering when you pass show_ship as true...how can we fix this?
  
  def render(show_ship = false)
    return  "S" if show_ship == true && @ship
    if @fired_upon == false
      return "."
    elsif @fired_upon == true && @ship == nil
      return "M"
    elsif @fired_upon == true && @ship && @ship.health != 0
      return "H"
    elsif @fired_upon == true && @ship && @ship.health == 0
      puts "ship sunk"
      return "X"
    end 
  end 

end
