
class Player
  attr_reader :guesses, :ships_remaining

  def initialize
    @guesses = []
    @ships_remaining = 2
  end

  def ship_sunk
    @ships_remaining -= 1
  end

end 
