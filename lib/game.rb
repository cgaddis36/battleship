require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/computer'
require 'pry'

class Game
  attr_accessor :player1, :player_supplied_coordinates
  attr_reader :player2, :placement_coordinates

  def initialize
    @player_supplied_coordinates = "0"
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @player_board = Board.new
    @computer_board = Board.new
    @ship = 0
    @player_cruiser_coordinates = []
    @player_submarine_coordinates = []
  end

  def start
    puts "****------Welcome to BATTLESHIP------****".center(40)
    puts "Enter p to play. Enter q to quit.".center(40)
      start_or_quit = gets.chomp.downcase
      if start_or_quit == "q"
        puts "Shutting down systems"
        exit
      elsif
        start_or_quit == "p"
        puts "Starting Battleship!"
      else
        puts "Oops, invalid entry."
        start
      end
  end

  def player_enter_squares_and_validates_them
  puts  "\n\n\n I have laid out my ships on the grid.
  You now need to lay out your two ships.
  The Cruiser is three units long and the Submarine is two units long.
  1 2 3 4
  A . . . .
  B . . . .
  C . . . .
  D . . . ."
    gets_position_input
end

def gets_position_input
  if @player_cruiser_coordinates == []
    @ship = @cruiser
    spaces = "3"
  else
    @ship = @submarine
    spaces = "2"
  end
  puts "Enter the squares for the #{@ship.name}
  (format example: A1 A2 A3)
  (enter #{spaces} spaces):"
  @player_supplied_coordinates = gets.chomp
  check_coordinates
end

  def check_coordinates
  split_player_supplied_coordinates
  coordinates = @player_board.placement_coordinates
    if @ship == @cruiser
      @player_cruiser_coordinates = @player_board.placement_coordinates
    else
      @player_submarine_coordinates = @player_board.placement_coordinates
    end
  ship = @ship
    if @player_board.valid_placement?(ship, coordinates) == false
      input_error
    else
      @player_board.place(ship, coordinates)
      puts "\n\n\n ----------- \n\n\n"
      puts @player_board.render(true)
    end
    if @player_submarine_coordinates == []
      player_enter_squares_and_validates_them
    end
  end

  def split_player_supplied_coordinates
  @player_board.placement_coordinates = @player_supplied_coordinates.split
  end

  def input_error
    ship = @ship
    puts "Those are invalid coordinates. Please try
    again:"
    @player_supplied_coordinates = gets.chomp
    check_coordinates
  end

  def gets_submarine_position_input
    puts "Enter the squares for the Submarine
    (format example: B1 B2)
    (enter 2 spaces):"
    @player_supplied_coordinates = gets.chomp
    check_coordinates
  end

  # def player_take_turn
  #   turn = Turn.new(guess)
  #     turn.player_takes_turn
  #     coordinate = turn.guess
  #     return turn.turn_input_error_message if @board.cells[coordinate]
  #     if @player_board[coordinate].fired_upon == false
  #       @player_board[coordinate].fire_upon
  #       @player_guesses << [coordinate]
  #     elsif
  #       @player_board[coordinate].fired_upon == true
  #         turn.turn_input_error_message
  #     end

end


      # turn.computer_takes_turn
