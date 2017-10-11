require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.first).to be_a(Card)
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      cards = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).to_not eq(cards)
    end
  end

  describe "#draw_card" do
    it "returns a card" do
      expect(deck.draw_card).to be_a(Card)
    end

    it "reduces the size of the deck" do
      size = deck.cards.length
      deck.draw_card
      expect(deck.cards.length).to be < size
    end

    it "raises an error if the deck is empty" do
      52.times do
        deck.draw_card
      end
      expect { deck.draw_card }.to raise_error(RuntimeError)
    end
  end

  describe "#is_empty?" do
    it "returns true if the deck has no cards" do
      expect(deck.is_empty?).to be_falsey
    end

    it "returns false if the deck has cards" do
      52.times do
        deck.draw_card
      end
      expect(deck.is_empty?).to be_truthy
    end
  end
end
