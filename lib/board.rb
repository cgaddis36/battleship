require 'pry'
require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells, :rows, :columns
  attr_accessor :placement_coordinates

  def initialize
    @columns = []
    @rows = []
    @placement_coordinates = []
    @consecutive = false
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
    @ship_size = 0
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def all_valid?
    @placement_coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.include?(nil)
    @placement_coordinates = coordinates
    (ship.length == coordinates.count) && all_valid? && empty_cell? && consecutive? && diagonal? && duplicate_coordinates?
  end

  def consecutive?
    @columns = @placement_coordinates.map {|coordinate| coordinate.slice(1)}
    @rows = @placement_coordinates.map {|coordinate| coordinate.slice(0)}
    columns_values_consecutive_or_same? && row_values_consecutive_or_same?
  end

  def row_values_consecutive_or_same?
    return false if @rows.uniq.sort != @rows.uniq
    return true if @rows.uniq.count == 1
    rows_sorted = @rows.uniq
      a = rows_sorted[0]
      b = rows_sorted[-1]
    rows_range_array = (a..b).to_a
    ord_rows_sorted = []
      rows_sorted.each do |letter|
        ord_rows_sorted << letter.ord
      end
    rows_sorted_ctally = ord_rows_sorted[0]
      ord_rows_sorted.all? do |num|
        num + 1 == rows_sorted_ctally += 1
      end
  end

  def columns_values_consecutive_or_same?
    return false if @columns.uniq.sort != @columns.uniq
    return true if @columns.uniq.count == 1
    columns_sorted = @columns.uniq
      x = columns_sorted[0]
      y = columns_sorted[-1]
    column_range_array = (x..y).to_a
    ord_columns_sorted = []
      columns_sorted.each do |string|
        ord_columns_sorted << string.ord
      end
    columns_sorted_ctally = ord_columns_sorted[0]
      ord_columns_sorted.all? do |num|
        num + 1 == columns_sorted_ctally += 1
      end
  end

  def diagonal?
    @columns.max == @columns.min ||
    @rows.max == @rows.min
  end

  def place(ship, coordinates)
    coordinates.each do |key|
      @cells[key].place_ship(ship)
    end
  end

  def empty_cell?
    @placement_coordinates.all? do |key|
      @cells[key].ship == nil
    end
  end

  def duplicate_coordinates?
    @placement_coordinates.uniq.count == @placement_coordinates.count
  end

  def render(show = false)
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n" +
      "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n" +
      "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n" +
      "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n"
  end
end
