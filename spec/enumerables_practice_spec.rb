require_relative '../lib/enumerables_practice.rb'

describe "enumerable" do
  before :each do
    @a = [1,2,3]
  end
  describe 'my_each' do
    it 'calls the block on each element' do
      fill = []
      @a.my_each {|el| fill << (el + 1)}
      expect(fill).to eq([2,3,4])
    end
  end

  describe 'my_select' do
    it "selects the elements that satisfy the given block" do
      expect(@a.my_select {|el| el % 2 == 1}).to eq([1,3])
    end
    it "returns an empty array if none satisfy the given block" do
      expect(@a.my_select { |num| num == 4 }).to eq([])
    end
  end

  describe 'my_reject' do

    it "rejects the elements that satisfy the given block" do
      expect(@a.my_reject {|el| el % 2 == 1}).to eq([2])
      expect(@a.my_reject { |num| num > 1 }).to eq([1]) # => [1]
    end

    it "returns the full array if none satisfy the given block" do
      @a.my_reject { |num| num == 4 } # => [1, 2, 3]
    end

  end

  describe 'my_any?' do
    it "returns true if any of the elements satisfy the given block" do
      expect(@a.my_any? {|el| el < 2}).to eq(true)
    end
    it "returns false if none of the elements satisfy the given block" do
      expect(@a.my_any? {|el| el > 3}).to eq(false)
    end
  end

  describe 'my_all?' do
    it "returns true if all of the elements satisfy the given block" do
      expect(@a.my_all? {|el| el <= 3}).to eq(true)
    end
    it "returns false if one of the elements doesn't satisfy the given block" do
      expect(@a.my_all? {|el| el != 2}).to eq(false)
    end
  end
end
