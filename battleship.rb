require './lib/game'
require 'pry'

puts "Welcome to BATTLESHIP \n\n"
print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>"
response = gets.chomp.downcase

if response ==  "p"
  game = Game.new
  game.randomly_assign_coordinates
  print "I have laid out my ships on the grid.
  You now need to layout your two ships.
  The first is two units long and the
  second is three units long.
  The grid has A1 at the top left and D4 at the bottom right."

  puts "Enter the squares for the two-unit ship: "
  response = gets.chomp
  puts "Enter the squares for the three-unit ship: "
  second_response = gets.chomp
  game.get_coordinates(response, second_response)

  while game.over == false
    puts "Take a shot!  Don't forget the grid has A1 at the top left and D4 at the bottom right."
    guess = gets.chomp
    puts game.computer.shot(guess)
    puts game.computer.board.display_board

    guess = game.person.board.get_random_coord
    puts "The computer guessed #{guess}"
    game.person.shot(guess)
    puts game.person.board.display_board
  end

  puts game.over

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
