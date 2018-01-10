class Little_Bot

  def initialize
    @color_options = ['R', 'G', 'B', 'P']
    @guesses = [@color_options[0..3]]
    @hints = []
    @responses = [
                    "This might work\n",
                    "I think this is right\n",
                    "I hope I guess it right\n",
                    "Maybe this ?\n"
                  ]
  end

  def get_input
    puts "#{@responses[Random.rand(@responses.size)]}"
    return @guesses[0].join if @guesses.size < 2

    @guesses.last
  end

  def store_board_response(response)
    [["R", "G", "B", "P"], ["0", "0", "0", "1"]]
    puts "#{response}"
    @hints << response.last

    new_guess = []
    for i in (0..@guesses[0].size) # plug the right guesses
      new_guess[i] = @guesses.last[i] if @hints.last[i] == "1"
    end

    @guesses << new_guess
  end

  def get_guess_for(num)

  end

end
