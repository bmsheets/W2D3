require_relative "card"

class Hand

  HAND_RANKINGS = {
    royal_flush: 10,
    straight_flush: 9,
    four_of_a_kind: 8,
    full_house: 7,
    flush: 6,
    straight: 5,
    three_of_a_kind: 4,
    two_pair: 3,
    pair: 2,
    high_card: 1,
  }

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def ranking
    HAND_RANKINGS[best_hand]
  end

  def best_hand
    if is_royal_flush?
      :royal_flush
    elsif is_straight_flush?
      :straight_flush
    elsif is_four_of_a_kind?
      :four_of_a_kind
    elsif is_full_house?
      :full_house
    elsif is_flush?
      :flush
    elsif is_straight?
      :straight
    elsif is_three_of_a_kind?
      :three_of_a_kind
    elsif is_two_pair?
      :two_pair
    elsif is_pair?
      :pair
    else
      :high_card
    end
  end

  def values
    @cards.map { |card| card.value }
  end

  def is_pair?
    values.any? { |value| values.count(value) >= 2 }
  end

  def is_two_pair?
    num_pairs = 0
    values.uniq.each do |value|
      num_pairs += 1 if values.count(value) >= 2
    end
    num_pairs > 1
  end

  def is_three_of_a_kind?
    values.any? { |value| values.count(value) >= 3 }
  end

  def is_straight?
    numerical_values = @cards.map { |card| Card::VALUES[card.value] }
    numerical_values.sort.each_index do |i|
      next if i == numerical_values.length - 1
      return false if numerical_values[i] != numerical_values[i + 1] + 1
    end
    true
  end

  def is_flush?
    @cards.all? { |card| card.suit == @cards.first.suit }
  end

  def is_full_house?
    is_two_pair? && is_three_of_a_kind?
  end

  def is_four_of_a_kind?
    values.any? { |value| values.count(value) >= 4 }
  end

  def is_straight_flush?
    is_straight? && is_flush?
  end

  def is_royal_flush?
    return false unless is_straight_flush?
    numerical_values = @cards.map { |card| Card::VALUES[card.value] }
    numerical_values.sort == [10, 11, 12, 13, 14]
  end
end

#hand1.ranking > hand2.ranking
