require './lib/board'
require './lib/ship'

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
        @destroyer.hit_ship(guess)
        board.find_space(guess)[0].display = "H"
        destroyer.display_sunk
      elsif search_ship_coords(@cruiser, guess)
        @cruiser.hit_ship(guess)
        board.find_space(guess)[0].display = "H"
        cruiser.display_sunk
      else
        board.find_space(guess)[0].display = "M"
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

  def all_sunk
    @destroyer.sunk && @cruiser.sunk
  end

end
