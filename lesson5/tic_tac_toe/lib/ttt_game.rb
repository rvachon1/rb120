class TTTGame
  include Promptable
  include Verifiable
  attr_accessor :result
  attr_reader :board, :next_up

  def initialize
    @player1_score = 0
    @player2_score = 0
    @result = :none
  end

  def play
    intro
    loop do
      make_board
      who_first
      loop do
        clear
        board.draw
        select_move
        break if winner? || full?
        alternate_turn
      end
      clear
      board.draw
      print_game_result
      break if !play_again?
      clear
      print_play_again
    end
    goodbye_message
  end

  private

  def intro
    clear
    welcome_message
    player1_setup
    whose_playing
  end

  def welcome_message
    prompt("Welcome to Tic Tac Toe!")
  end

  def clear
    system "clear"
  end

  def player1_setup
    @player1 = Human.new
    @player1.select_symbol
  end

  def whose_playing
    choice = verify("Would you like to play versus a Computer? (Y/n)", ["y", "n"])
    @player2 = case choice.downcase
               when "y" then Computer.new
               when "n" then Human.new
               end
    @player2.other_symbol(@player1.symbol)
  end

  def make_board
    @board = Board.new
  end

  def who_first
    prompt("Who plays first?")
    choice = verify("Press '1' for #{@player1.name} | Press '2' for #{@player2.name}", ["1", "2"])
    @next_up = case choice
               when "1" then @player1
               when "2" then @player2
               end
  end

  def alternate_turn
    @next_up = case @next_up
               when @player1 then @player2
               when @player2 then @player1
               end
  end

  def select_move
    choice = @next_up.select_move(board)
    prompt("#{@next_up.name} chooses: #{choice}")
  end

  def winner?
    case board.winning_symbol
    when @player1.symbol
      self.result = :player1
      true
    when @player2.symbol
      self.result = :player2
      true
    else
      false
    end
  end

  def full?
    self.result = :draw if board.full?
  end

  def print_game_result
    case result
    when :player1
      prompt("Congratulations, #{@player1.name}! YOU WIN!")
      @player1_score += 1
    when :player2
      case @player2.class.to_s
      when "Human"
        prompt("Congratulations, #{@player2.name}! YOU WIN!")
      when "Computer"
        prompt("YOU LOSE! #{@player2.name} wins...")
      end
      @player2_score += 1
    when :draw
      prompt("DRAW! No One Wins...")
    end
    print_score
  end

  def play_again?
    choice = verify("Do you want to play again? (Y/n)", ["y", "n"])
    choice.downcase == "y"
  end

  def print_score
    prompt("The score is #{@player1.name}: #{@player1_score} vs. "\
            "#{@player2.name}: #{@player2_score}")
  end

  def goodbye_message
    print_score
    if @player1_score > @player2_score
      prompt("#{@player1.name} Wins!")
    elsif @player2_score > @player1_score
      prompt("#{@player2.name} Wins!")
    else
      prompt("It was a DRAW!")
    end
  end

  def print_play_again
    prompt("Okay! Let's play again!")
  end
end