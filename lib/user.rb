require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class User
  attr_reader :gameplay

  def initialize(gameplay)
    @gameplay = gameplay
    @user = user
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine")
  end


end
