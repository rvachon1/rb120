class Cards
  NUMBERS = ("2".."10").to_a + ["J", "Q", "K", "A"]
  SUITS = ["s", "c", "d", "h"]
  VALUES = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 10,
    "Q" => 10,
    "K" => 10,
    "A" => 1,
    "A-high" => 11
  }
  attr_reader :deck

  def initialize
    @deck = []
    build_deck
  end

  def shuffle!
    @deck.shuffle!
  end

  def deal(players, dealer, num_cards)
    num_cards.times do |_|
      players.each { |player| player.dealt_card(@deck.pop) }
      dealer.dealt_card(@deck.pop)
    end
  end
  
  def deal_one(participant)
    participant.dealt_card(@deck.pop)
  end
  
  private
  
  def build_deck
    SUITS.each do |suit|
      NUMBERS.each do |num|
        @deck << num + "_" + suit
      end
    end
  end
end