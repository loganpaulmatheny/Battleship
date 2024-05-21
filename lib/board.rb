require './lib/cell'
class Board 
  # U is to create a cells method that will create 16 cells and place them in a hash
  # M 
  # - I can use two loops to pass the appropriate arguments to the Cell.new() constructor  
  # P 
  ## - create a for loop that runs for [A-D]
  ## - inside that loop create another loop that runs through [1-4]
  ## - the inner loop should create the cell objects
  ## ? how can we do this such that we will not have to create the initial object and reference it? 


  def initialize 
    @cells = {}
    @columns = ('A'..'D').to_a
    @rows = (1..4).to_a
  end

  def cells
    @columns.each do |letter|
      @rows.each do |row|
        @cells["#{letter}#{row}"] = Cell.new("#{letter}#{row}")
      end
    end 
    @cells
  end 

end 

# require 'pry'; binding.pry