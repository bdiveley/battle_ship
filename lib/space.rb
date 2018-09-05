class Space
  attr_accessor :coordinate,
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
