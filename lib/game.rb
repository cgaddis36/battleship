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
    @computer = Computer.new
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
    @computer.cruiser_cells_selection
    validate_cruiser_coordinates
  end

  def validate_cruiser_coordinates
      if @computer_board.valid_placement?(@computer_cruiser, @computer.cruiser_cells)
        @computer_board.place(@computer_cruiser, @computer.cruiser_cells)
      else
        loop do
          @computer_board.valid_placement?(@computer_cruiser, @computer.cruiser_cells)
          @computer.cruiser_cells_selection
          break if @computer_board.valid_placement?(@computer_cruiser, @computer.cruiser_cells)
          @computer_board.place(@computer_cruiser, @computer.cruiser_cells)
        end
      end
  end

  def computer_submarine_placement
    @computer.random_cell
    @computer.submarine_cells_selection
    validate_submarine_coordinates
  end

  def validate_submarine_coordinates
    if  @computer_board.valid_placement?(@computer_submarine, @computer.submarine_cells)
      @computer_board.place(@computer_submarine, @computer.submarine_cells)
    else
      loop do
        @computer_board.valid_placement?(@computer_submarine, @computer.submarine_cells)
        @computer.submarine_cells_selection
        break if @computer_board.valid_placement?(@computer_submarine, @computer.submarine_cells)
      end
      @computer_board.place(@computer_submarine, @computer.submarine_cells)
    end
  end

  def player_takes_turn
    puts "===========COMPUTER BOARD==========="
    puts @computer_board.render
    puts "============PLAYER BOARD============"
    puts @player_board.render
    puts "Take a guess"
    player_shot
  end

  def player_shot
    puts "Enter the coordinates for your shot:"
    player_cell_choice = gets.chomp.upcase
      if @computer_board.valid_coordinate?(player_cell_choice) == false
        puts "Invalid coordinate, please try again =D"
        player_takes_turn
      elsif
        @computer_board.cells[player_cell_choice].fired_upon == false
        @computer_board.cells[player_cell_choice].fire_upon
        ships_sunk?
        computer_takes_shot
        player_takes_turn
      else
        puts "Oops. You've already hit this square. Please select another:"
        player_takes_turn
      end
    end

    def ships_sunk?
      if @computer_cruiser.sunk? && @computer_submarine.sunk?
        puts "***You WIN!! Hooray!!***".center(40)
        puts "***GAME OVER!!***".center(40)
        q
      elsif
        @player_cruiser.sunk? && @player_submarine.sunk?
        puts "SORRY! Computer intelligence surpasses yours today.".center(100)
        q
      else
        false
      end
    end

    def computer_takes_shot
      @computer.random_cell
      if @player_board.cells[@computer.start_cell].fired_upon == false
        @player_board.cells[@computer.start_cell].fire_upon
      else
        loop do
          @player_board.cells[@computer.start_cell].fired_upon == false
          @computer.random_cell
          break if @player_board.cells[@computer.start_cell].fired_upon == false
          @player_board.cells[@computer.start_cell].fire_upon
        end
      end
    end
end
