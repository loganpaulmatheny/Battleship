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

  def valid_placement?(ship, coordinates)
    valid_length = check_ship_coordinates?(ship, coordinates)
    consecutive_placement = consecutive_coordinates?(coordinates)

    if valid_length == false || consecutive_placement == false 
      return false
    else 
      return true
    end 
    
  end 
  
  def check_ship_coordinates?(ship, coordinates)
    if ship.length == coordinates.length
      return true
    else 
      return false
    end  
  end 

  def consecutive_coordinates?(coordinates)
    letters = coordinates.map { |coord| coord[0] }
    numbers = coordinates.map { |coord| coord[1..-1].to_i }
  
    all_letters_same = letters.uniq.size == 1
    # Are all the letters the same? - basically this says count the unique characters
    all_numbers_same = numbers.uniq.size == 1

    # I could have read further along and that would have helped me solve this on my own 
    # Helpful Enumerables
    # Ruby has an enumerable method called each_cons that allows you to access consecutive elements in a collection. See the Ruby Docs for more details.
    # Also consider if the enumerables any?, all?, none? would be helpful.
  
    letters_consecutive = true
    # this might be called a flag
    (1...letters.size).each do |i|
    # the `...` is called an exclusive range vs. an inclusive one denoted by `..`
    # why might you ask do we need to use exclusive rather than inclusive? 
      # that is because we are starting at the second index rather than the first. so we want to ensure we go through letters.size - 1 rather than the entire array
      if letters[i].ord != letters[i - 1].ord + 1
      # .ord converts the value to the ASCII value thus you can compare their ASCII numbers
        letters_consecutive = false
        break
      end
    end
  
    numbers_consecutive = true
    (1...numbers.size).each do |i|
      if numbers[i] != numbers[i - 1] + 1
        numbers_consecutive = false
        break
      end
    end
  
    (all_letters_same && numbers_consecutive) || (all_numbers_same && letters_consecutive)
    # This simply checks to make sure you either have consecutive letters or numbers and not diagonals 
  end


end 

# require 'pry'; binding.pry