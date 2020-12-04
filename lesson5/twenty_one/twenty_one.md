# Verbal Description
Twenty one is two player card game with a player and a dealer. 
The dealer deals two cards to the player and themself.
One of the dealers cards remains face down while the other remains face up.
The player can HIT or STAY. HIT - get another card. STAY - No more cards.
The Dealer can HIT or STAY. The dealer MUST stay at 17 or higher.
Highest hand wins. Over 21 is a bust.

# Grouping
* TwentOneGame
  - det_winner

* Participant
  - hit
  - stay
  - show_hand
  - bust?
* Player < BasicPlayer
  - name
* Dealer < BasicPlayer
  - seventeen?
  - show_one

* Cards
  - deal
  - shuffle