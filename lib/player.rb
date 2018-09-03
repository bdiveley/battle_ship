class Player
  attr_reader :destroyer,
              :cruiser

  def initialize
    @destroyer = Ship.new("2")
    @cruiser = Ship.new("3")
  end

end
