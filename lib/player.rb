require './lib/ship'
require './lib/board'

class Player
  attr_reader :destroyer,
              :cruiser,
              :board

  def initialize
    @destroyer = Ship.new("2")
    @cruiser = Ship.new("3")
    @board = Board.new
  end

  def shot(guess)
    if board.space_available?(guess)
      if search_ship_coords(@destroyer, guess)
        #need to change display on specific space
        "You hit the destroyer"
      elsif search_ship_coords(@cruiser, guess)
        #need to change display on specific space
        "You hit the cruiser"
      else
        #need to change display on specific space
        "You missed!"
      end
    else
      "This spot has already been guessed.  Try again!"
    end
  end

  def search_ship_coords(ship, guess)
    ship.coordinates.any? do |coord|
      coord == guess
    end
  end

end
