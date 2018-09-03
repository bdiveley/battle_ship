require './lib/game'
require './lib/player'
require './lib/ship'
require 'pry'


puts "Welcome to BATTLESHIP \n\n"
print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>"

response = gets.chomp.downcase

if response ==  "p"
  game = Game.new
  game.randomly_assign_coordinates
  game.get_coordinates


elsif
  response == "i"
    "These are the instructions for now"
else
  response == "q"
  p "quit"
end
