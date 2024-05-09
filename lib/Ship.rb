
class Ship 
  attr_reader  :name, :length, :health
  
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end 

  def hit 
    @health = @health - 1
    if @health == 0
      @sunk = true
    end 
  end 

  def sunk? 
    @sunk
  end 

end 

# Ship Class 
  # What did i learn from this class?
  # I learned how pry can be used to work within a session

# Cell
