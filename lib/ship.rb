class Ship
    attr_reader :length,
                :coordinates

  def initialize(length)
    @length = length
    @coordinates = []
  end

  def randomize
    ["A", "B", "C", "D"].sample +
    ["1", "2", "3","4"].sample
  end

  def verify_first_coord
    if @length == 2
      first = "D4"
      while first == "D4"
        first = randomize
      end
    else
      first = "D4"
      while first == "C3" || first == "C4" ||
            first == "D3" || first == "D4"
        first = randomize
      end
    end
      @coordinates << first
      return first
  end

  def random_orientation
    first = @coordinates[0]
    orientation = ["vertical", "horizontal"].sample
    if @length == 2
      orientation = "horizontal" if first[0] == "D"
      orientation = "vertical" if first[1] == "4"
    else
      if first[0] == "D" || first[0] == "C"
        orientation = "horizontal"
      elsif first[1] == "3" || first[1] == "4"
        orientation = "vertical"
      end
    end
    return orientation
  end

  def verify_next_coord
    orientation = random_orientation
    index = 0

    binding.pry
    while @coordinates.count < @length.to_i
      if orientation == "vertical"
        next = alpha_compares(alpha_compares(@coordinates[index][0]) + 1) + @coordinates[index][-1]
      elsif
        next = @coordinates[index][0] + (@coordinates[index][1].to_i + 1).to_s
      end
      @coordinates << next
      index += 1
    end
  end

  def alpha_compares(coord)
    key = {"A" => 1, "B" => 2, "C" => 3, "D" => 4}
    if coord.class == String
      key[coord]
    else
      alpha = key.find do |num|
        num[1] == coord
      end
      return alpha[0]
    end
  end

end
