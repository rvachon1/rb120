class GuessingGame
  def initialize(low, high)
    @upper_bound = high
    @lower_bound = low
    @guesses_remaining = always_win_guesses
    @result = :none
  end
  
  def play
    @number = rand(@upper_bound + 1)
    loop do
      print_remaining
      get_guess
      det_guesses
      print_result
      break if (@result == :won) || (@result == :lost)
    end
    reset_game
  end

  private

  def always_win_guesses
    Math.log2(@upper_bound - @lower_bound).to_i + 1
  end

  def print_remaining
    puts "You have #{@guesses_remaining} guesses remaining."
    print_enter_guess
  end

  def print_enter_guess
    puts "Enter a value between #{@lower_bound} and #{@upper_bound}:"
  end

  def get_guess
    loop do
      choice = gets.chomp
      if validate_guess(choice)
        @choice = choice.to_i
        low_or_high
        break
      else
        invalid_guess
        print_enter_guess
      end
    end
  end

  def validate_guess(choice)
    (@lower_bound..@upper_bound).include?(choice.to_i)
  end

  def low_or_high
    if @choice > @number
      @guesses_remaining -= 1
      set_high
      puts "Your guess is too high"
      empty_line
    elsif @choice == @number
      @result = :won
    else
      @guesses_remaining -= 1
      set_low
      puts "Your guess is too low"
      empty_line
    end
  end

  def set_low
    @lower_bound = @choice + 1
  end

  def set_high
    @upper_bound = @choice - 1
  end

  def det_guesses
    @result = :lost if @guesses_remaining == 0
  end

  def invalid_guess
    puts "Invalid guess"
  end

  def print_result
    if @result == :won
      puts "You Won!"
      empty_line
    elsif @result == :lost
      puts "You have no more guesses. You lost!"
      empty_line
    else
    end
  end

  def reset_game
    @choice = nil
    @guesses_remaining = 7
    @result = :none
  end

  def empty_line
    puts "\n"
  end
end

game = GuessingGame.new(0, 50)
game.play
