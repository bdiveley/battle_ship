class Space
  attr_reader :coordinate,
              :display

  def initialize(coordinate)
    @coordinate = coordinate
    @display = " "
  end

end
