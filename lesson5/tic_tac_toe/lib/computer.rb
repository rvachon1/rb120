class Computer < Player
  NAMES = ["R2D2", "Bender", "Gustard", "MeowMix"]

  def select_name
    name = NAMES.sample
    @name = name
  end

  def select_symbol
    @symbol = ["X", "O"].sample
  end

  def select_move(board)
    choice = board.available_spaces.sample
    board.make_move(choice, symbol)
    choice
  end
end