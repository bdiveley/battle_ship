class Board
  attr_reader :grid

  def initialize
    @grid = {A:[Space.new("A1"), Space.new("A2"), Space.new("A3"), Space.new("A4")],
             B: [Space.new("B1"), Space.new("B2"), Space.new("B3"), Space.new("B4")],
             C: [Space.new("C1"), Space.new("C2"), Space.new("C3"), Space.new("C4")],
             D: [Space.new("D1"), Space.new("D2"), Space.new("D3"), Space.new("D4")]}
  end
end
