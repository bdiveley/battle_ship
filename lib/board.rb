require './lib/space'

class Board
  attr_reader :grid

  def initialize
    @grid = [[Space.new("A1"), Space.new("A2"), Space.new("A3"), Space.new("A4")], [Space.new("B1"), Space.new("B2"), Space.new("B3"), Space.new("B4")], [Space.new("C1"), Space.new("C2"), Space.new("C3"), Space.new("C4")], [Space.new("D1"), Space.new("D2"), Space.new("D3"), Space.new("D4")]]
  end

  def get_display_array
    display_array = []
    @grid.each.with_index do |array|
      counter = 0
      while counter < 4
        display_array << array[counter].display
        counter +=1
      end
    end
    return display_array
  end

  def display_board
    string = get_display_array.join
    " =========== \n .  1234 \n A: #{string[0..3]} \n B: #{string[4..7]} \n C: #{string[8..11]} \n D: #{string[12..15]} \n ==========="
  end

  def space_display?(guess)
    found = []
    @grid.each do |array|
      counter = 0
      while counter < 4
        if array[counter].coordinate == guess
          found << array[counter].coordinate
          found << array[counter].display
        end
        counter +=1
      end
    end
    found[1] == " "
  end

end
