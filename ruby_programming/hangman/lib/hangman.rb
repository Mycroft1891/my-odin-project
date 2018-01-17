class Hangman

  attr_accessor :word, :guesses, :attempts

  $image = [
     '
      _________
              |
              |
              |
              |
              |
     ',
     '
      _________
       |      |
              |
              |
              |
              |
     ',
     '
      _________
       |      |
       O      |
              |
              |
              |',
     '
      _________
       |      |
       O      |
       |      |
              |
              |',
     '
      _________
       |      |
       O      |
      /|      |
              |
              |',
     '
      _________
       |      |
       O      |
      /|\     |
              |
              |',
     '
      _________
       |      |
       O      |
      /|\     |
      /       |
              |',
     '
      _________
       |      |
       O      |
      /|\     |
      / \     |
              |'
    ]

  def check_word(letter)
    wrong_guess = true
    for i in 0..@word.length
      if @word[i] == letter
        @guesses[i]  = letter
        wrong_guess  = false
      end
    end
    $image.shift   if wrong_guess
    @attempts -= 1 if wrong_guess
    puts "#{$image.first}\nWord:\t#{@guesses.join}\n\n"
  end

end
