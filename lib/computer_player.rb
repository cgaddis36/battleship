require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



class ComputerPlayer
  attr_reader :name

  def initialize(name = "Computer")
    @name = name
  end

  def places_its_ships
    choose_cruiser_placement
    choose_submarine_placement
  end

  def choose_cruiser_placement(length = 3)

    



end
