class Little_Bot

  def initialize
    @color_options = ['R', 'G', 'B', 'P']
    @guesses = [@color_options[0..3]]
    @hints = []
    @responses = ["This might work\n",
                  "I think this is right\n",
                  "I hope I guess it right\n",
                  "Maybe this ?\n"]
    @code_length = 4
  end

  def get_input
    puts "#{@responses[Random.rand(@responses.size)]}"
    return @guesses.first.join if @guesses.size < 2
    @guesses.last.join
  end

  def store_board_response(response)
    @hints << response.last

    new_guess = []
    keep = []
    for i in (0..@code_length) # plug the right guesses
      new_guess[i]    = @guesses.last[i] if @hints.last[i] == "1"
      keep << @guesses.last[i] if @hints.last[i] == "0"
    end

    keep.shuffle!

    for i in (0..@code_length)
      new_guess[i] = keep.first if @hints.last[i] == "0"
      keep.shift
    end

    @guesses << new_guess
  end

end
