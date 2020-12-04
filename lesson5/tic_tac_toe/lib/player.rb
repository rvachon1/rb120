class Player
  include Promptable
  include Verifiable
  attr_reader :symbol, :name

  def initialize
    @name = select_name
  end

  def other_symbol(symbol)
    @symbol = case symbol
              when "X" then "O"
              when "O" then "X"
              end
  end
end
