class Game
    attr_reader :computer,
                :person

  def initialize
    @computer = Player.new
    @person = Player.new
  end



end
