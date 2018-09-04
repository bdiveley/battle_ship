class Space
  attr_reader :coordinate,
              :display

  def initialize(coordinate)
    @coordinate = coordinate
    @display = " "
  end

  def hit
    @display = "H"
  end

  def miss
    @display = "M"
  end 

end
