require 'minitest/autorun'
require 'minitest/benchmark'

require './caeser'
require './bubble_sort'


describe "Caeser shift" do
  it 'shifts correctly' do
    assert_equal caeser('abc', 1), 'bcd'
  end

  it 'wraps around z' do
    assert_equal caeser('xyz', 1), 'yza'
  end

  it 'works with capital letters' do
    assert_equal caeser('ABC', 1), 'BCD'
  end

  it 'preserves spaces' do
    assert_equal caeser('abc abc', 1), 'bcd bcd'
  end
end


describe "Bubble Sort" do
  it 'returns the list if it has less than 2 numbers' do
    assert_equal bubble_sort([1]), [1]
  end

  it 'sorts the array' do
    assert_equal bubble_sort([5,2,4,6,1,7,3]), [1,2,3,4,5,6,7]
  end
end
