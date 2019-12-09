require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class User
  def initialize(game)
    @game = game
  end
