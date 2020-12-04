class TwentyOneGame
  include Promptable
  include Verifiable

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @cards = Cards.new
    @result = :none
  end

  def play
    welcome_message
    loop do
      deal_cards
      show_initial_cards
      players_turn
      dealers_turn if !@player.bust?
      det_winner
      break if !play_again?
      reset_cards
    end
    goodbye_message
  end

  private

  def welcome_message
    clear
    prompt("Welcome to Twenty One!")
  end

  def deal_cards
    @cards.shuffle!
    @cards.deal([@player], @dealer, 2)
  end

  def show_initial_cards
    prompt("The Dealer Has: ")
    show_hand(@dealer, 1)
    empty_line
    prompt("The Player Has: ")
    show_hand(@player)
    empty_line
    prompt("Totalling: #{@player.total}")
    empty_line
  end

  def players_turn
    loop do
      choice = verify("1 - Hit, 2 - Stay", ["1", "2"])
      clear
      if choice == "1"
        hit(@player)
      else
        prompt("Player Stays with: #{@player.total}")
        break
      end
      if @player.bust?
        prompt("#{@player.total} - Player Bust!")
        @result = :dealer
        break
      end
    end
  end

  def dealers_turn
    loop do
      if @dealer.greater_eql_17?
        prompt("#{@dealer.total} - Dealer Stays")
        break
      else
        hit(@dealer)
      end
      if @dealer.bust?
        prompt("#{@dealer.total} - Dealer Busts!")
        @result = :player
        break
      end
    end
  end

  def hit(participant)
    @cards.deal_one(participant)
    prompt("#{participant.name} HITS a #{participant.last_card}")
    show_hand(participant)
    empty_line
    prompt("#{participant.name} total: #{participant.total}")
  end

  def show_hand(participant, num=:all)
    case num
    when :all then participant.hand.each { |card| print "#{card} " }
    else
      num.times { |i| print "#{participant.hand[i]} " }
      (participant.hand.count - num).times { |_| print "_ " }
    end
  end

  def det_winner
    set_winner if @result == :none
    print_winner
  end

  def set_winner
    @result = if @player.total > @dealer.total
                :player
              elsif @dealer.total > @player.total
                :dealer
              else
                :draw
              end
  end

  def print_winner
    case @result
    when :dealer then prompt("Game Over. Dealer Wins...")
    when :player then prompt("CONGRATULATIONS! YOU WIN!")
    when :draw then prompt("DRAW! No body wins.")
    else
      prompt("Error. Unknown result.")
    end
  end

  def play_again?
    verify("Do you want to play again? (Y/n)", %w(y n)) == "y"
  end

  def reset_cards
    @player.reset_hand
    @dealer.reset_hand
    @cards = Cards.new
    @result = :none
  end

  def goodbye_message
    prompt("Thank you for playing! Goodbye.")
  end
end
