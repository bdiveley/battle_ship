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

  def get_coordinates(response, second_response)
    @person.destroyer.assign_coordinates(response)
    @person.cruiser.assign_coordinates(second_response)
  end

  def over
    if computer.all_sunk
      over = true
      "You win!"
    elsif
      person.all_sunk
      over = true
      "You lose!"
    else
      over = false
    end
  end

end
