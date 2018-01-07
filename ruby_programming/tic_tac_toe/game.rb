require './Board'
require './Player'

board = Board.new

print "\nWelcome to TIC TAC TOE\n"

print "Player 1 => Input your name: "
name_1 = gets.chomp
print "Player 2 => Input your name: "
name_2 = gets.chomp

p1 = Player.new(name_1, "X")
p2 = Player.new(name_2, "O")

print "\n#{p1.name} you are X\n#{p2.name} you are O\n"
print "===== Instructions =====\n"
print "The Grid is numbered from 1-9:\n"
print "\t1 | 2 | 3\n\t4 | 5 | 6\n\t7 | 8 | 9\n"
print "To make a move just type a number\n"
print "The Game Manager will fill the spot with your mark\n"

while board.game_over != true
  print "\n(X) #{p1.name} enter your move: "
  move = gets.chomp.to_i
  board.saveMove(move, "X")

  print "\n(O) #{p2.name} enter your move: "
  move = gets.chomp.to_i
  board.saveMove(move, "O")
end

print "\n===== GAME OVER =====\n"
print "\t#{board.winner} won the game\n"
print "\tCongratulations"
