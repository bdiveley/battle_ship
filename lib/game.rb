require './lib/player'

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
    puts "Enter the squares for the two-unit ship: "
    response = gets.chomp
    @person.destroyer.assign_coordinates(response)
    puts "Enter the squares for the three-unit ship: "
    second_response = gets.chomp
    @person.cruiser.assign_coordinates(second_response)
  end

  # def over
  #   if computer.all_sunk == true
  #     over = true
  #     "You win!"
  #   elsif
  #     person.all_sunk == true
  #     over = true
  #     "You lose!"
  #   else
  #     over = false
  #   end
  # end

end
