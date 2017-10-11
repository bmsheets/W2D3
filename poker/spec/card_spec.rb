require 'rspec'
require 'card'

describe Card do

  subject(:card) { Card.new(:ace, :spades) }

  describe "#initialize" do
    it "accepts a value" do
      expect(card.value).to eq(:ace)
    end

    it "accepts a suit" do
      expect(card.suit).to eq(:spades)
    end
  end

  describe "#to_s" do
    it "prints a suit and value" do
      expect(card.to_s).to eq("ace of spades")
    end
  end
end
