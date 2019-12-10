require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

class Turn
  attr_accessor :player1
  attr_reader :player2

  def initialize(player1 = "Player One", player2 = "Computer")
    @player1 = player1
    @player2 = player2
    @user_board = user_board
    @user_guesses = []
    @computer_guesses = []
    @computer_board = computer_board
  end

  def player_takes_turn
puts "=============COMPUTER BOARD============="
puts @computer_board.render
puts "==============PLAYER BOARD=============="
puts @player_board.render(true)




#player enters coordinates
#coordinate is validated
#if not valid, guess again
#if valid hit cell
#record guesses in array? do we need to save them if cell values change?
#computer's turn if ships not sunk.
#if all ships sunk, game over
  end

  def computer_takes_turn
    #computer enters random coordinate
    #coordinate is validated
    #if not valid, guess again
    #if valid hit cell
    #record guesses in array? do we need to save them if cell values change?
    #players turn if ships not sunk.
    #if all ships sunk, game over
  end












end
Turn:

User board is displayed showing hits, misses, sunken ships, and ships
Computer board is displayed showing hits, misses, and sunken ships
Computer chooses a random shot
Computer does not fire on the same spot twice
User can choose a valid coordinate to fire on
Entering invalid coordinate prompts user to enter valid coordinate
Both computer and player shots are reported as a hit, sink, or miss
User is informed when they have already fired on a coordinate
Board is updated after a turn
