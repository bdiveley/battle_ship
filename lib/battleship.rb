
puts "Welcome to BATTLESHIP \n\n"
print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>"

response = gets.chomp.downcase

if response ==  "p"
  game = Game.new
elsif
  response == "i"
    "These are the instructions for now"
else
  response == "q"
  p "quit"
end
