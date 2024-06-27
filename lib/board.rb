require './lib/cell'
class Board 
  attr_reader :cells
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
    populate_cells
  end

  def populate_cells
    @columns.each do |letter|
      @rows.each do |row|
        @cells["#{letter}#{row}"] = Cell.new("#{letter}#{row}")
      end
    end 
    @cells
  end 

  def place(ship, coordinates)
    # Check if the placement is valid
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end 
      true
    else
      # If the placement is not valid, return false
      puts "Invalid placement"
      false
    end
  end

  def place_ship_random(ship)
    valid = false
    tries = 0 

    until valid 
      tries += 1
      puts "Attempt ##{tries}"
      # randomly picks an orientation for the ship
      orientation = [:horizontal, :vertical].sample
      # create an array and then randomly select a row
      row = ("A".."D").to_a.sample
      # randomly selects a number between 1 and 4
      col = rand(1...4)
      if orientation == :horizontal
        # creates an array of coordinates the length of the ship (0 to ship - 1)
        coordinates = (0...ship.length).map { |i| "#{row}#{col + i}" }
      else 
        # convert the letters into ASCII to move consequtively
        coordinates = (0...ship.length).map { |i| "#{(row.ord + i).chr}#{col}"}
      end 

      puts "Trying coordinates: #{coordinates.inspect}"

      valid_coordinates = coordinates.all? { |coord| @cells.key?(coord) }
      # check to see if this a valid pairing
      if valid_coordinates
        self.place(ship, coordinates)
        valid = true
        puts "Ship placed at: #{coordinates.inspect}"
      end 
    end 
    true
  end
  

  def valid_placement?(ship, coordinates)
    valid_length = check_ship_coordinates?(ship, coordinates)
    consecutive_placement = consecutive_coordinates?(coordinates)
    overlap = placement_unoccupied?(coordinates)

    if valid_length == false || consecutive_placement == false || overlap == false
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

  def placement_unoccupied?(coordinates)
     # there needs to be the check if there is a ship already in any of the coordinates
     coordinates.each do |coordinate|
      # Check if there is already a ship at this coordinate
      if @cells[coordinate]&.ship.nil?
        # Place the ship at this coordinate
        next
      else
        # If any coordinate is occupied, print a message and return false
        puts "There's already a ship at #{coordinate}"
        return false
      end
    end
    # If all coordinates are valid and unoccupied, return true
    return true    
  end

  def render(show_ships = false) 
    # U - how can we create the headings? 
    # M 
      # need to iterate through the coordinates letters
      # need to iterate through the coordinates numbers
      # need to add a blank in the 
      # is it easier to keep track of what row we're on? 
    # P
      # first just print the headings 
      # iterate the first row of A coordinates including the coordinate header 1 
      # iterate the next row of B coordinates including coordinate header 2 
    print " "
    @rows.each { |row| print row.to_s + " "}
    print "\n"

    @columns.each do |letter|
      print letter + " "
      @rows.each do |row|
        coordinate = "#{letter}#{row}"
        print @cells[coordinate].render(show_ships)
      end 
      print "\n"
    end 
    # @cells.each do |coordinate, cell|
    #   print coordinate + "-" + cell.render(show_ships) + " "
    #   print "\n" if coordinate.end_with?("4")
    # end 
  end

end 

# require 'pry'; binding.pry