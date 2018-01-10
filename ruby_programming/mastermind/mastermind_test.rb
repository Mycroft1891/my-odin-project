require 'minitest/autorun'

require './Board'

describe "Board Class" do
  describe "#give_hint_for" do
    it "returns when the user inputs more than 4 colors" do
      b = Board.new
      assert_equal b.give_hint_for('abcde'), "Input only 4 colors"
    end
  end
end
