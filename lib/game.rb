class Game
    attr_reader :computer,
                :person

  def initialize
    @computer = Player.new
    @person = Player.new
  end

  def randomly_assign_coordinates
    @computer.destroyer.verify_first_coord
    @computer.destroyer.verify_next_coord
    @computer.cruiser.verify_first_coord
    @computer.cruiser.verify_next_coord
  end

  def get_coordinates
    print "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship: "
    response = gets.chomp
    @person.destroyer.assign_coordinates(response)
    second_response = gets.chomp
    @person.cruiser.assign_coordinates(second_response)
  end

end
