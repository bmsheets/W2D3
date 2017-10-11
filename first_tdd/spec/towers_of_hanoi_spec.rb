require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do

  subject(:towers) { TowersOfHanoi.new }

  describe "#move" do
    it "raises error when moving from position with no disks" do
      expect{ towers.move(1, 2) }.to raise_error(RuntimeError)
    end

    it "raises error when it tries to move a larger disk onto a smaller disk" do
      expect{ towers.move(0,1).move(0,1) }.to raise_error(RuntimeError)
    end

    it "performs a valid move" do
      expect(towers.move(0,1).disks).to eq([[2, 3], [1], []])
    end
  end

  describe "#won?" do
    it "returns true when its a winning position" do
      towers = TowersOfHanoi.new([[], [], [1, 2, 3]])
      expect(towers.won?).to be_truthy
    end
  end
end
