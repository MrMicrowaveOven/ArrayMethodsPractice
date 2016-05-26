require_relative '../lib/array_practice.rb'

describe 'array' do
  describe 'my_flatten' do
    it "returns the array if no nested arrays" do
      expect([1,2,3].my_flatten).to eq([1,2,3])
    end
    it "flattens a shallow nested array" do
      expect([1,2,[3]].my_flatten).to eq([1,2,3])
    end
    it "flattens a nested array" do
      expect([1,2,[3,4]].my_flatten).to eq([1,2,3,4])
    end
    it "flattens a deeply nested array" do
      expect([1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten).to eq([1,2,3,4,5,6,7,8])
    end
  end

  describe 'my_zip' do
    before :each do
      @a = [ 4, 5, 6 ]
      @b = [ 7, 8, 9 ]
    end
    it "returns array if no arguments are given" do
      expect([1,2,3].my_zip).to eq([1,2,3])
    end

    it "zips three arrays" do
      expect([1, 2, 3].my_zip(@a, @b)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end
    it "zips three arrays of differing length" do
      expect([1, 2].my_zip(@a, @b)).to eq([[1, 4, 7], [2, 5, 8]])
    end
    it "zips three arrays of differing length" do
      expect(@a.my_zip([1,2], [8])).to eq([[4, 1, 8], [5, 2, nil], [6, nil, nil]])
    end
    it "zips five arrays" do
      c = [10, 11, 12]
      d = [13, 14, 15]
      expect([1, 2].my_zip(@a, @b, c, d)).to eq([[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]])
    end
  end

  describe 'my_rotate' do
    before :each do
      @a = [ "a", "b", "c", "d" ]
    end
    it "rotates by one element when not given an argument" do
      expect(@a.my_rotate).to eq(["b", "c", "d", "a"])
    end
    it "rotates by two elements when given an argument of 2" do
      expect(@a.my_rotate(2)).to eq(["c", "d", "a", "b"])
    end
    it "rotates the opposite direction when given a negative argument" do
      expect(@a.my_rotate(-3)).to eq(["b", "c", "d", "a"])
    end
    it "rotates the by a modular when given a large argument`" do
      expect(@a.my_rotate(15)).to eq(["d", "a", "b", "c"])
    end
  end

  describe 'my_join' do
    before :each do
      @a = [ "a", "b", "c", "d" ]
    end
    it "joins elements with an empty string if no argument is given" do
      expect(@a.my_join).to eq("abcd")
    end
    it "joins elements with given argument" do
      expect(@a.my_join("$")).to eq("a$b$c$d")
    end
  end

  describe 'my_reverse' do
    it "reverses an array" do
      expect([ "a", "b", "c" ].my_reverse).to eq(["c", "b", "a"])
    end
    it "returns the array if length < 2" do
      expect([ 1 ].my_reverse).to eq([1])
    end
  end
end
