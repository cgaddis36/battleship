require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/user'
require './lib/computer'


class Gameplay
  attr_reader :computer, :user

  def initialize(computer, user)
    @computer = computer
    @user = user
  end




end 
