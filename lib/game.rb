require './lib/player'

class Game
    attr_reader :computer,
                :person,
                :gameover

  def initialize
    @computer = Player.new
    @person = Player.new
    @gameover = false
  end

  def randomly_assign_coordinates
    @computer.destroyer.verify_first_coord
    @computer.destroyer.verify_next_coord
    @computer.cruiser.verify_first_coord
    @computer.cruiser.verify_next_coord
  end

  def get_coordinates
    puts "Take your first shot!  Remember the grid has A1 at the top left and D4 at the bottom right."
    response = gets.chomp
    @person.destroyer.assign_coordinates(response)
    puts "Enter the squares for the three-unit ship: "
    second_response = gets.chomp
    @person.cruiser.assign_coordinates(second_response)
  end

end
