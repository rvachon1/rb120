class Participant
  attr_accessor :hand
  attr_reader :name

  def initialize
    @hand = []
  end

  def dealt_card(card)
    @hand << card
  end
  
  def last_card
    @hand.last
  end

  def hit(card)
    @hand << card
  end

  def bust?
    total > 21
  end

  def total
    if @hand.any? { |card| card.match(/A/) } # Check for A
      ace_handler(@hand.clone.map(&:clone))
    else # IF NO ACE
      calc_total(@hand)
    end
  end

  def reset_hand
    @hand = []
  end

  private

  def ace_handler(hand)
    ace = hand.detect { |card| card =~ /A/ } # Find first Ace
    ace_index = hand.index(ace) # Get index of Ace
  
    hand[ace_index].sub!(/A/, "A-high") # Convert A to A-high
  
    if calc_total(hand) > 21 # If bust
      hand[ace_index].sub!(/A-high/, "A") # Revert to A
    end
  
    calc_total(hand)
  end

  def calc_total(hand)
    values = []
  
    hand.each do |card|
      values << Cards::VALUES[card.split("_")[0]]
    end
    values.reduce(&:+)
  end
end