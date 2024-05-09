
class Cell
  attr_reader :ship

  def initialize(cell)
    @cell = cell
    @ship = nil
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
end