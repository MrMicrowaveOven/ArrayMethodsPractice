require_relative '../enumerables_practice.rb'

describe 'my_each' do
  it 'calls the block on each element' do
    fill = []
    [1,2,3].my_each {|el| fill << (el + 1)}
    expect(fill).to eq([2,3,4])
  end
end

describe 'my_select' do
  it "selects the elements that satisfy the given block" do
    expect([1,2,3].my_select {|el| el % 2 == 1}).to eq([1,3])
  end
end

describe 'my_reject' do
  it "rejects the elements that satisfy the given block" do
    expect([1,2,3].my_reject {|el| el % 2 == 1}).to eq([2])
  end
end
