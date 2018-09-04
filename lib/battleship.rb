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

  # game.display_board

elsif
  response == "i"
  new_file = File.open('./data/instructions.txt', "r")
  display = new_file.read
  display.each_line do |line|
  puts line
    end
elsif
  response == "q"
  p "See ya later!"
end
