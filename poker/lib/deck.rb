require_relative "card"

class Deck

  attr_reader :cards

  def initialize
    @cards = generate_deck
  end

  def generate_deck
    deck = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        deck << Card.new(value, suit)
      end
    end
    deck
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw_card
    raise "Deck is empty, cannot draw card" if is_empty?
    @cards.pop
  end

  def is_empty?
    @cards.empty?
  end
end
