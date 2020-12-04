class Human < Player
  def select_name
    prompt("Please enter the Player's name:")
    name = gets.chomp
    @name = name
  end

  def select_symbol
    choice = verify("Select your symbol: 'X' or 'O'", ["x", "o"])
    @symbol = choice.upcase
  end

  def select_move(board)
    choice = verify("#{name} select an available space: ", board.available_spaces)
    board.make_move(choice, symbol)
    choice
  end
end