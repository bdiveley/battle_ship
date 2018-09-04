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
end
