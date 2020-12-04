module Promptable
  def prompt(message)
    puts "==> #{message}"
  end
end

class Move
  MOVES = %w(rock paper scissors)
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def ==(other)
    return true if value == other.value
  end

  def >(other)
    (rock? && other.scissors?) || (paper? && other.rock?) ||
      (scissors? && other.paper?)
  end
end

class Player
  include Promptable
  attr_accessor :move, :name, :history

  def initialize
    set_name
  end

  def prompt(message)
    puts "==> #{message}"
  end
end

class Human < Player
  def set_name
    prompt("Please choose a name:")
    self.name = gets.chomp
  end

  def choose
    choice = ""
    loop do
      prompt("Please choose 'rock', 'paper', or 'scissors'!")
      choice = gets.chomp.downcase
      break if Move::MOVES.include?(choice)
      prompt("Invalid choice. Please choose 'rock', 'paper', or 'scissors'!")
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  COMPUTERS = {
    R2D2: Move::MOVES.sample(2), # Only gets 2 Random Moves
    Meowith: [Move::MOVES.first], # Only gets ROCK
    Gustard: Move::MOVES, # Gets all three options
    Bender: [Move::MOVES.last] # Only gets SCISSORS
  }

  def set_name
    self.name = COMPUTERS.keys.sample
  end

  def choose
    @move = Move.new(COMPUTERS[name].sample)
  end
end

class RPSGame
  include Promptable
  attr_reader :human, :computer
  attr_accessor :human_score, :computer_score, :game_count

  WINNING_SCORE = 5

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_score = 0
    @computer_score = 0
    @game_count = 0
    @move_history = {}
  end

  def display_welcome_message
    prompt("Welcome to Rock, Paper, Scissors, #{human.name}!")
  end

  def display_match_winner
    prompt("With a score of #{human_score} - #{computer_score}. The winner is...")
    if human_score == 5 
      prompt("#{human.name}!!! CONGRATULATIONS!!!")
    else computer_score == 5
      prompt("#{computer.name}. YOU LOSE!!!")
    end
  end

  def display_goodbye_message
    display_match_winner if (human_score == WINNING_SCORE) || (computer_score === WINNING_SCORE)
    prompt("Thank you for playing! Goodbye! **#{computer.name} waves**")
  end

  def increment_game_count
    self.game_count += 1
  end

  def record_moves
    @move_history[@game_count] = {
      human.name => human.move.value,
      computer.name => computer.move.value
    }
  end

  def display_moves
    prompt("#{human.name} chose: #{human.move.value.upcase} | "\
      "#{computer.name} chose: #{computer.move.value.upcase}")
  end

  def determine_winner
    if human.move > computer.move
      prompt("#{human.name} WON!! Congratulations!")
      @human_score += 1
    elsif human.move == computer.move
      prompt("It's a DRAW!")
    else
      prompt("#{human.name} LOSES!!")
      @computer_score += 1
    end
  end

  def play_again?
    choice = ""
    loop do
      prompt("Do you want to play again? (Y/n)")
      choice = gets.chomp.downcase
      break if (choice == "y") || (choice == "n")
      prompt("Invalid choice. Do you want to play again? (Y/n)")
    end
    choice == "y"
  end

  def display_score
    prompt("The score is #{human.name}: #{human_score} - #{computer.name}: "\
            "#{computer_score}")
  end

  def match_winner?
    (human_score == WINNING_SCORE) || (computer_score == WINNING_SCORE)
  end

  def print_move_history
    prompt("Entire match move history:")
    @move_history.each do |game, move_hash|
      puts "Game" + game.to_s + ": " + move_hash.to_s
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      increment_game_count
      record_moves
      display_moves
      determine_winner
      display_score
      break if match_winner? == true
      break if play_again? == false
    end
    display_goodbye_message
    print_move_history
  end
end

RPSGame.new.play
