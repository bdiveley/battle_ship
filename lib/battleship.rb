require './lib/game'
require 'pry'


puts "Welcome to BATTLESHIP \n\n"
print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>"
response = gets.chomp.downcase

if response ==  "p"
  game = Game.new
  game.randomly_assign_coordinates
  game.get_coordinates

#make this a loop
puts game.person.board.display_board
p "Take your first shot!  Remember the grid has A1 at the top left and D4 at the bottom right."
guess = gets.chomp
puts game.computer.shot(guess)
puts game.computer.board.display_board
#let computer take a guess
#display person's Board
#loop back to beginning until game = end

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
