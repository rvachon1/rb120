class Dealer < Participant
  NAMES = ["DebbyDealer", "RoboDealer", "GusDealer"]

  def initialize
    @name = NAMES.sample
    super
  end

  def greater_eql_17?
    total >= 17
  end

  def show_first_card
    @hand.first
  end
end