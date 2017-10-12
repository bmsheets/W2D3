require 'rspec'
require 'hand'

describe Hand do

  subject (:hand) { Hand.new }
  let (:bad_hand) do
    cards = [ Card.new(:two, :diamonds),
              Card.new(:three, :clubs),
              Card.new(:five, :spades),
              Card.new(:seven, :diamonds),
              Card.new(:eight, :hearts)]
    Hand.new(cards)
  end

  describe "#is_pair?" do
    it "returns true if hand contains a pair" do
      hand.cards << Card.new(:ace, :hearts)
      hand.cards << Card.new(:ace, :diamonds)
      hand.cards << Card.new(:eight, :spades)
      hand.cards << Card.new(:fours, :clubs)
      hand.cards << Card.new(:seven, :hearts)
      expect(hand.is_pair?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_pair?).to be_falsey
    end
  end

  describe "#is_two_pair?" do
    it "returns true if hand contains two pairs" do
      hand.cards << Card.new(:four, :clubs)
      hand.cards << Card.new(:four, :spades)
      hand.cards << Card.new(:three, :clubs)
      hand.cards << Card.new(:three, :diamonds)
      hand.cards << Card.new(:queen, :spades)
      expect(hand.is_two_pair?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_two_pair?).to be_falsey
    end
  end

  describe "#is_three_of_a_kind?" do
    it "returns true if hand contains a three of a kind" do
      hand.cards << Card.new(:seven, :clubs)
      hand.cards << Card.new(:seven, :diamonds)
      hand.cards << Card.new(:seven, :spades)
      hand.cards << Card.new(:king, :clubs)
      hand.cards << Card.new(:three, :diamonds)
      expect(hand.is_three_of_a_kind?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_three_of_a_kind?).to be_falsey
    end
  end

  describe "#is_straight?" do
    it "returns true if hand contains a straight" do
      hand.cards << Card.new(:nine, :clubs)
      hand.cards << Card.new(:eight, :diamonds)
      hand.cards << Card.new(:seven, :spades)
      hand.cards << Card.new(:six, :diamonds)
      hand.cards << Card.new(:five, :hearts)
      expect(hand.is_straight?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_straight?).to be_falsey
    end
  end

  describe "#is_flush?" do
    it "returns true if hand contains a flush" do
      hand.cards << Card.new(:four, :spades)
      hand.cards << Card.new(:jack, :spades)
      hand.cards << Card.new(:eight, :spades)
      hand.cards << Card.new(:two, :spades)
      hand.cards << Card.new(:nine, :spades)
      expect(hand.is_flush?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_flush?).to be_falsey
    end
  end

  describe "#is_full_house?" do
    it "returns true if hand contains a full house" do
      hand.cards << Card.new(:ten, :hearts)
      hand.cards << Card.new(:ten, :diamonds)
      hand.cards << Card.new(:ten, :spades)
      hand.cards << Card.new(:nine, :clubs)
      hand.cards << Card.new(:nine, :diamonds)
      expect(hand.is_full_house?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_full_house?).to be_falsey
    end
  end

  describe "#is_four_of_a_kind?" do
    it "returns true if hand contains a four of a kind" do
      hand.cards << Card.new(:jack, :hearts)
      hand.cards << Card.new(:jack, :diamonds)
      hand.cards << Card.new(:jack, :spades)
      hand.cards << Card.new(:jack, :clubs)
      hand.cards << Card.new(:seven, :diamonds)
      expect(hand.is_four_of_a_kind?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_four_of_a_kind?).to be_falsey
    end
  end

  describe "#is_straight_flush?" do
    it "returns true if hand contains a straight flush" do
      hand.cards << Card.new(:eight, :clubs)
      hand.cards << Card.new(:seven, :clubs)
      hand.cards << Card.new(:six, :clubs)
      hand.cards << Card.new(:five, :clubs)
      hand.cards << Card.new(:four, :clubs)
      expect(hand.is_straight_flush?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_straight_flush?).to be_falsey
    end
  end

  describe "#is_royal_flush?" do
    it "returns true if hand contains a royal flush" do
      hand.cards << Card.new(:ace, :diamonds)
      hand.cards << Card.new(:king, :diamonds)
      hand.cards << Card.new(:queen, :diamonds)
      hand.cards << Card.new(:jack, :diamonds)
      hand.cards << Card.new(:ten, :diamonds)
      expect(hand.is_royal_flush?).to be_truthy
    end

    it "returns false if hand does not contain a pair" do
      expect(bad_hand.is_royal_flush?).to be_falsey
    end
  end

end
