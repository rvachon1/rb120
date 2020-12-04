require_relative 'participant'

class Player < Participant
  def initialize
    @name = "Ryan"
    super
  end
end