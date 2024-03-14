
class Ship 
  attr_reader  :name, :health
  
  def initialize(name, length)
    @name = name
    @length = length
    @health = length

  end 

end 