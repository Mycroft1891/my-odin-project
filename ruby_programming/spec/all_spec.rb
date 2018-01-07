require 'caeser'
require 'bubble_sort'


describe "Caeser shift" do
  it 'shifts correctly' do
    expect(caeser('abc', 1)).to eq('bcd')
  end

  it 'wraps around z' do
    expect(caeser('xyz', 1)).to eq('yza')
  end

  it 'works with capital letters' do
    expect(caeser('ABC', 1)).to eq('BCD')
  end

  it 'preserves spaces' do
    expect(caeser('abc abc', 1)).to eq('bcd bcd')
  end
end


describe "Bubble Sort" do
  it 'returns the list if it has less than 2 numbers' do
    expect(bubble_sort([1])).to eq([1])
  end

  it 'sorts the array' do
    expect(bubble_sort([5,2,4,6,1,7,3])).to eq([1,2,3,4,5,6,7])
  end
end
