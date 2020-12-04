# Tic Tac Toe Planning

A human and a computer play a boad game in which there are four intersecting
lines; two vertical and two horizontal. The player who goes first starts
by selecting either "X" or "O". They then make their first move by selecting
one of the 9 open squares. Then it's the computers turn to make a move.
The winner is the player who has three of their symbol in a straight line
in any direction.

# Major Nouns and Verbs

## Nouns
* Player
  * Human
  * Computer
* GameBoard

## Verbs
* Move
* Play

## Non-Obvious Classes
* TTTGame

# Spike

## Player
* select_symbol
* @symbol
* name_select
* @name
* select_move

### Human

### Computer
* select_symbol

## Board
* initialize
  * build_board
* make_move

## GameState
* @player1
* @player2
* @player1_score
* @player2_score
* @game_board

* initialize
  * whose_playing - Is there a computer playing?
* det_winner
* display_board