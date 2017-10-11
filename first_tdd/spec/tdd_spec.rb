require 'rspec'
require 'tdd'

describe "#my_uniq" do

  subject(:arr) {[1, 2, 1, 3, 3]}

  it "removes duplicates" do
    expect(my_uniq(arr)).to eq([1, 2, 3])
    expect(my_uniq([1,1,1,2,2,2,5,5,5])).to eq([1,2,5])
    expect(my_uniq([1])).to eq([1])
  end

end

describe "#two_sum" do

  subject(:arr) {[-1, 0, 2, -2, 1]}

  it "returns all pairs of zero-summing indicies" do
    expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
  end

  it "expects result array to be sorted by first index" do
    expect(two_sum(arr)).to eq(two_sum(arr).sort)
  end

end

describe "#transpose" do
  subject(:matrix) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }

  it "transposes the matrix" do
    expect(transpose(matrix)).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ])
  end

  it "returns the matrix if 1x1" do
    expect(transpose([[1]])).to eq([[1]])
  end
end

describe "#pick_stocks" do

  subject(:stocks) { [5, 12, 13, 8, 25] }

  it "returns the two indicies which represent the greatest difference in stock price" do
    expect(pick_stocks(stocks)).to eq([0, 4])
  end

  it "raises an error if input array has fewer than two elements" do
    expect { pick_stocks([4]) }.to raise_error(RuntimeError)
  end

end
