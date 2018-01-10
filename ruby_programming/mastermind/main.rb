require './Board'
require './Little_Bot'

def start_codemaker_mode
  puts "You chose to be the Codemaker, you can chose from these colors:\n"
  puts "\tRed (R)\n\tGreen (G)\n\tBlue (B)\n\tPurple (P)\n\n"
  puts "Input your 4 color code: "
  user_colors = gets.chomp
  board = Board.new(colors: user_colors)
  bot   = Little_Bot.new
  display_rules

  while board.player_guessed_right != true
    puts "\nGuess my Code:\n"
    bot_input = bot.get_input
    sleep 2
    puts bot_input
    sleep 2
    puts board.check(bot_input)
    sleep 2
    bot.store_board_response(board.response)
  end
end

def start_codebreaker_mode
  board = Board.new
  display_rules

  while board.player_guessed_right != true
    puts "\nGuess my Code:\n"
    user_input = gets.chomp
    puts board.check(user_input)
  end
end

def display_rules
  puts "===== Rules ====="
  puts "The codebreaker has 10 attempts to guess the right colors and their possitons."
  puts "These are the colors the codebreaker can choose from:\n"
  puts "\tRed (R)\n\tGreen (G)\n\tBlue (B)\n\tPurple (P)\n\n"
  puts "The codebreaker can submit his/her guess in lower case:\n"
  puts "ex:\trgbp\n\n"
  puts "I will give the codebreaker hints after each try\n"
  puts "ex:\t[0,1,0,0]\n\n"
  puts "0: for a right color at a wrong place\n"
  puts "1: for a right color at the right place\n"
  puts "So lets start guessing: ...\n"
end


puts "Welcome to Master Minds\n"
puts "Chose your play mode by typing choice:\n"
puts "\tCodemaker"
puts "\tCodebreaker"
user_choice = gets.chomp
/maker/.match(user_choice) ? start_codemaker_mode : start_codebreaker_mode
