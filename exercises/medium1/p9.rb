require_relative 'p8'

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    build_deck
  end

  def draw
    build_deck if @cards.empty?
    @cards.pop
  end

  private

  def build_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    shuffle_deck
  end

  def shuffle_deck
    @cards.shuffle!
  end
end

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.