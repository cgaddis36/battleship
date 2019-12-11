require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class Game
  attr_accessor :player_supplied_coordinates
  attr_reader :placement_coordinates, :player_board, :computer_board

  def initialize
    @player_supplied_coordinates = []
    @player_cruiser = Ship.new("Cruiser", 3)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_board = Board.new
    @computer_board = Board.new
    @ship = 0
    @player_cruiser_coordinates = []
    @player_submarine_coordinates = []
    @computer_cruiser_coordinates = []
    @computer_submarine_coordinates = []
    @computer = Computer.new
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
    @ship = @player_cruiser
    spaces = "3"
  else
    @ship = @player_submarine
    spaces = "2"
  end
  puts "Enter the squares for the #{@ship.name}
  (format example: A1 A2 A3)
  (enter #{spaces} spaces):"
  @player_supplied_coordinates = gets.chomp.upcase
  check_coordinates
end

  def check_coordinates
  split_player_supplied_coordinates
  coordinates = @player_board.placement_coordinates
    if @ship == @player_cruiser
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
      puts @computer_board.render(true)
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
    @player_supplied_coordinates = gets.chomp.upcase
    check_coordinates
  end

  def gets_submarine_position_input
    puts "Enter the squares for the Submarine
    (format example: B1 B2)
    (enter 2 spaces):"
    @player_supplied_coordinates = gets.chomp.upcase
    check_coordinates
  end

  def computer_cruiser_placement
    @computer.random_cell
    @computer.cruiser_cells_selection
    validate_cruiser_coordinates
  end

  def validate_cruiser_coordinates
    coordinates= @computer.cruiser_cells
    ship = @computer_cruiser
      if @computer_board.valid_placement?(ship, coordinates)
        @computer_board.place(ship, coordinates)
      else
        coordinates = []
        computer_cruiser_placement
      end
  end

  def computer_submarine_placement
    @computer.random_cell
    @computer.submarine_cells_selection
    validate_submarine_coordinates
  end

  def validate_submarine_coordinates
    coordinates = @computer.submarine_cells
    ship = @computer_submarine
      if @computer_board.valid_placement?(ship, coordinates)
        @computer_board.place(ship, coordinates)
      else
        coordinates = []
      end
  end

  def player_shot
        puts "Enter the coordinates for your shot:"
    player_coordinate = gets.chomp.upcase
      if !@computer_board.valid_coordinate?(player_coordinate)
        puts "Invalid coordinate, please try again =D"
      elsif
        @computer_board.cells[player_coordinate].fired_upon == false
        @computer_board.cells[player_coordinate].fired_upon
        computer_takes_shot
        ships_sunk?
        player_takes_turn
      else
        puts "Oops. You've already hit this square. Please select another:"
        player_takes_turn
      end
    end

    def player_takes_turn
      puts "===========COMPUTER BOARD==========="
      puts @computer_board.render
      puts "============PLAYER BOARD============"
      puts @player_board.render(true)
      puts "Take a guess"
      player_shot
    end

    def ships_sunk?
      if @computer_cruiser.sunk && @computer_submarine.sunk
        puts "***You WIN!! Hooray!!***".center(40)
        puts "***GAME OVER!!***".center(40)
      elsif
        @player_cruiser.sunk? && @player_submarine.sunk?
        puts "SORRY! Computer intelligence surpasses yours today.".center(100)
      else
        player_takes_turn
      end
    end

    def computer_takes_shot
      @computer.random_cell
      validate_computer_shot
    end

    def validate_computer_shot
      if @player_board.cells.has_key?(@computer.start_cell) && (@player_board.cells[@computer.start_cell].fire_upon == false)
        @player_board.cells[@computer.start_cell].fire_upon
      else
      computer_takes_shot
      end
    end
end
