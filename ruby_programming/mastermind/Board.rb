class Board
  attr_reader :player_guessed_right

  def initialize(options={})
    @colors = options[:colors].split("") || ['R', 'G', 'B', 'P'].shuffle
    @rounds = []
    @current_round = 1
    @player_guessed_right = false
  end

  def check(player_input)
    puts player_input
    return "Input only 4 colors" if player_input.size > 4
    player_input = player_input.upcase.split('')
    give_hint_for(player_input)
    @player_guessed_right = true if @rounds.last[1].join == '1111'
    if @player_guessed_right || @current_round > 10
      game_over_message
    else
      display_rounds
    end
  end

  def give_hint_for(player_input)
    new_hint = []
    @colors.each_with_index do |color, index|
      case
      when player_input[index] == color   then new_hint << '1'
      when player_input.include?(color)   then new_hint << '0'
      else new_hint << ' '
      end
    end
    @rounds.push([player_input, new_hint])
  end

  def display_rounds
    rounds_array = []
    @rounds.each_with_index do |round, index|
      round_num  = index < 10 ? "Round 0#{index}" : "Round #{index}"
      player_guess = round[0].join(' | ')
      ai_hint    = round[1].join(',')
      rounds_array << "(#{round_num}): #{player_guess}\t[#{ai_hint}]"
    end
    @current_round += 1
    rounds_array.join("\n")
  end

  def response
    @rounds.last
  end

  def game_over_message
    answer = @colors.join(', ')
    if @player_guessed_right
      "\n\n***** CONGRATULATIONS *****\nYou guessed it:\t[#{answer}]"
    else
      @player_guessed_right = true
      "I'm sorry, you ran out of guesses\nThe right code was:\n\t#{answer}"
    end
  end
end
