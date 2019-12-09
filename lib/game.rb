require './lib/ship'
require './lib/cell'
require './lib/board'

class Game
  attr_accessor :player1
  attr_reader :player2

  def initialize(player1 = "Player One", player2 = "Computer")
    @player1 = player1
    @player2 = player2
    @player_supplied_coordinates = 0
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
  end

  def start
    puts "Welcome to BATTLESHIP".center(40)
    puts "Enter p to play. Enter q to quit.".center(40)
      start_or_quit = gets.chomp.downcase
      if start_or_quit == "q"
        puts "See you next time!"
      elsif
        start_or_quit == "p"
      else
        puts "Oops, invalid entry."
        start
      end

  end

  def player_enter_cruiser_squares_and_validates_them

  puts  "\n\n\n I have laid out my ships on the grid.
  You now need to lay out your two ships.
  The Cruiser is three units long and the Submarine is two units long.
  1 2 3 4
  A . . . .
  B . . . .
  C . . . .
  D . . . .
  Enter the squares for the Cruiser
  (format example: A1 A2 A3)
  (enter 3 spaces):"
  @player_supplied_coordinates = gets.chomp
  split_player_supplied_coordinates
  coordinates = @board.placement_coordinates
  ship = @cruiser
  binding.pry
  @board.valid_placement?(ship, coordinates)
  @board.render
  end

  def split_player_supplied_coordinates
  @board.placement_coordinates = @player_supplied_coordinates.split
  end


  # def computer_places_ships
  #
  # end
  #
  # def play














  end
