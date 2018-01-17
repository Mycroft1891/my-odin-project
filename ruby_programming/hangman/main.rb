#!/usr/bin/env ruby

require './lib/game_manager'

manager = Game_Manager.new

# display prompt
puts '
    ||    ||   ||   ||     ||===|| ||   ||   ||   ||     _________
    ||    ||  ||||  ||==|| ||      ||= =||  ||||  ||==||  |      |
    ||====|| ||  || ||  || ||      || = || ||  || ||  ||  O      |
    ||====|| ||==|| ||  || ||===|| ||   || ||==|| ||  || /|\     |
    ||    || ||  || ||  || ||   || ||   || ||  || ||  || / \     |
    ||    || ||  || ||  || ||===|| ||   || ||  || ||  ||         |
    '

# prompt user to start game from progress
print "Do you want to load the previous game ? (yes/no): "
choice = gets.chomp
manager.load_game(choice)

# start while loop
while manager.playing && manager.attempts > 0
  print "\nGuess the word you have #{manager.attempts} attempts left: "
  user_input = gets.chomp
  manager.process_input(user_input)

  print "Save Progress ? (yes/no): "
  choice = gets.chomp
  manager.save_progress(choice)
end


if manager.playing
  puts '
        ||===||   ||   ||   || ||===||  ||===|| ||  || ||===|| ||===||
        ||       ||||  ||= =|| ||       ||   || ||  || ||      ||   ||
        ||===|| ||  || || = || ||===||  ||   || ||  || ||===|| ||===||
        ||   || ||==|| ||   || ||       ||   ||  ||||  ||      || \\\
        ||===|| ||  || ||   || ||===||  ||===||   ||   ||===|| ||  \\\
       '
else
  puts '
        ||  || ||===|| ||   ||   ||  ||  || ||| ||
         ||||  ||   || ||   ||   ||  ||  || ||| ||==||
          ||   ||   || ||   ||   ||  ||  || ||| ||  ||
          ||   ||   || ||   ||    ||||||||  ||| ||  ||
          ||   ||===|| ||===||     ||  ||   ||| ||  ||
       '
end
