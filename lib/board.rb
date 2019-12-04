class Board
  attr_reader :cells, :rows, :columns, :columns_sorted, :rows_sorted

  def initialize
    @cells = {
          "A1" => Cell.new("A1"),
          "A2" => Cell.new("A2"),
          "A3" => Cell.new("A3"),
          "A4" => Cell.new("A4"),
          "B1" => Cell.new("B1"),
          "B2" => Cell.new("B2"),
          "B3" => Cell.new("B3"),
          "B4" => Cell.new("B4"),
          "C1" => Cell.new("C1"),
          "C2" => Cell.new("C2"),
          "C3" => Cell.new("C3"),
          "C4" => Cell.new("C4"),
          "D1" => Cell.new("D1"),
          "D2" => Cell.new("D2"),
          "D3" => Cell.new("D3"),
          "D4" => Cell.new("D4"),
          }
           @rows = []
           @columns = []
           @placement_coordinates = []
           @columns_sorted = []
           @rows_sorted = []
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates = [])
    return false if coordinates.length != ship.length
      @placement_coordinates = coordinates
      coordinates.all? do |coordinate|
        valid_coordinate?(coordinate)
      end
      @placement_coordinates.each do |coordinate|
        @rows << coordinate.slice(0)
        @columns << coordinate.slice(1)
      end
      @rows_sorted = @rows.sort
      @columns_sorted = @columns.sort
      require "pry"; binding.pry
      end
      @columns_sorted.max == @columns_sorted.min
      require "pry"; binding.pry
    end
