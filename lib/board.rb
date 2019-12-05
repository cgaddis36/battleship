require 'pry'
class Board
  attr_reader :cells, :rows, :columns, :placement_coordinates

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
    @columns = []

    @rows = []

    @placement_coordinates = []
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates = [])
      @placement_coordinates = coordinates
    return false if coordinates.length != ship.length

      @placement_coordinates.all? do |coordinate|
        valid_coordinate?(coordinate)
      end
      consecutive_method
  end

  def consecutive_method
    @placement_coordinates.each do |coordinate|
        columns << coordinate.slice(1)
        rows << coordinate.slice(0)
    end
    columns_sorted = columns.sort
      x = columns_sorted[0]
      y = columns_sorted[-1]
    column_range_array = (x..y).to_a

     rows_sorted = rows.sort
      a = rows_sorted[0]
      b = rows_sorted[-1]
    rows_range_array = (a..b).to_a

    return false if columns.sort != column_range_array &&
                    rows.sort != rows_range_array
    return false if columns.sort == column_range_array &&
                    rows.sort == rows_range_array
      else
        true
      end
  end
# @columns.all? do |num|
#  num == @columns[0]
#  end
#  ||
#  @rows.all? do |letter|
#    letter == @rows[0]
#  end
