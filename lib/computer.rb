require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class Computer

  def initialize(gameplay)
    @gameplay = gameplay
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)

  end










end
