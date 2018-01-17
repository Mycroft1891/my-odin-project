require './lib/hangman'
require 'json'

class Game_Manager < Hangman
  attr_accessor :playing

  def initialize(options={})
    @playing = true
    @attempts = 8
    @guesses = []
    pick_word
  end

  def pick_word
    text_file   = File.open("5desk.txt")
    clean_words = text_file.map(&:chomp)
    word_list   = clean_words.select { |w| w.length > 5 && w.length < 12 }
    random_num  = Random.rand(word_list.length)
    @word       = word_list[random_num]
    @guesses.fill("_", 0..@word.length - 1)
  end

  def process_input(user_input)
    check_word(user_input)
    @playing = false if !@guesses.include?("_")
  end

  def save_progress(choice)
    return if choice.downcase != "yes"
    progress = {
      "word": "#{@word}",
      "user_guess": "#{@guesses.join}",
      "attempts": @attempts
    }
    File.write("progress.json", progress.to_json)
  end

  def load_game(choice)
    return if choice.downcase != "yes"
    file = File.read("progress.json")
    progress = JSON.parse(file)
    @word    = progress["word"]
    @guesses = progress["user_guess"].split("")
    @attempts= progress["attempts"]
  end
end
