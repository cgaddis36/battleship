require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

class Turn
  attr_accessor :player1, :@player_guesses
  attr_reader :player2, :guess

  def initialize(player1 = "Player One", player2 = "Computer")
    @player1 = player1
    @player2 = player2
    @player_guesses = []
    @computer_guesses = []
    @guess = guess
  end

  def player_takes_turn
    puts "=============COMPUTER BOARD============="
  puts @computer_board.render
  puts "==============PLAYER BOARD=============="
  puts @player_board.render(true)
  puts "Take a guess (input example: A4 )".center(40)
  @guess = gets.chomp

end

def turn_input_error_message
  puts "Oops. You've hit this square. Please select another:"
  @guess = gets.chomp
end






#player enters coordinates
#coordinate is validated
#if not valid, guess again
#if valid hit cell
#record guesses in array? do we need to save them if cell values change?
#computer's turn if ships not sunk.
#if all ships sunk, game over


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
# Turn:
#
# User board is displayed showing hits, misses, sunken ships, and ships
# Computer board is displayed showing hits, misses, and sunken ships
# Computer chooses a random shot
# Computer does not fire on the same spot twice
# User can choose a valid coordinate to fire on
# Entering invalid coordinate prompts user to enter valid coordinate
# Both computer and player shots are reported as a hit, sink, or miss
# User is informed when they have already fired on a coordinate
# Board is updated after a turn
