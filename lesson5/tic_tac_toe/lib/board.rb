class Board
  SPACES = (1..9).to_a
  WINNING_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  def initialize
    @spaces = {}
    SPACES.each { |key| @spaces[key] = Space.new(key) }
  end

  def draw
    puts "\n"
    puts "     |     |     "
    puts "  #{get_mark(1)}  |  #{get_mark(2)}  |  #{get_mark(3)}  "
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{get_mark(4)}  |  #{get_mark(5)}  |  #{get_mark(6)}  "
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{get_mark(7)}  |  #{get_mark(8)}  |  #{get_mark(9)}  "
    puts "     |     |     "
    puts "\n"
  end

  def winning_symbol
    win_comb = WINNING_COMBINATIONS.detect do |comb|
      (comb.all? { |space| @spaces[space].mark == "X" }) ||
        (comb.all? { |space| @spaces[space].mark == "O" })
    end
    win_comb.nil? ? nil : @spaces[win_comb[0]].mark
  end

  def full?
    @spaces.all? { |_, value| (value.mark == "X") || (value.mark == "O") }
  end

  def get_mark(space_num)
    @spaces[space_num].mark
  end

  def available_spaces
    available = @spaces.select do |_, value|
      value.available?
    end
    available.keys.map(&:to_s)
  end

  def make_move(space, symbol)
    @spaces[space.to_i].mark = symbol
  end
end