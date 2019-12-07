require 'pry'
require './lib/cell'
require './lib/ship'
class Board
  attr_reader :cells, :rows, :columns, :placement_coordinates

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
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def all_valid?
    @placement_coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end
  end

  def valid_placement?(ship, coordinates = [])
      @placement_coordinates = coordinates
      @rows = []
      @columns = []
    return false if coordinates.length != ship.length
    all_valid? && consecutive? && diagonal? && empty_cell?
  end

  def consecutive?
    @placement_coordinates.each do |coordinate|
      @columns << coordinate.slice(1)
        @rows << coordinate.slice(0)
    end
    columns_values_consecutive_or_same? && row_values_consecutive_or_same?
  end

  def row_values_consecutive_or_same?
    return false if @rows.uniq.sort != @rows.uniq
    rows_sorted = @rows.uniq
      a = rows_sorted[0]
      b = rows_sorted[-1]
    rows_range_array = (a..b).to_a
    ord_rows_sorted = []
    rows_sorted.each do |letter|
      ord_rows_sorted << letter.ord
    end
    rows_sorted_ctally = ord_rows_sorted[0]
    @row_values_consecutive_or_same = ord_rows_sorted.all? do |num|
      num + 1 == rows_sorted_ctally += 1
    end
  end

  def columns_values_consecutive_or_same?
    return false if @columns.uniq.sort != @columns.uniq
    columns_sorted = @columns.uniq
      x = columns_sorted[0]
      y = columns_sorted[-1]
    column_range_array = (x..y).to_a
    ord_columns_sorted = []
    columns_sorted.each do |string|
      ord_columns_sorted << string.ord
    end
    columns_sorted_ctally = ord_columns_sorted[0]
    @columns_values_consecutive_or_same = ord_columns_sorted.all? do |num|
      num + 1 == columns_sorted_ctally += 1
    end
  end
  def diagonal?
    @columns.max == @columns.min ||
    @rows.max == @rows.min
  end

  def place(ship, coordinates = [])
    coordinates.each do |key|
      cell = @cells[key]
        cell.place_ship(ship)
    end
  end

  def empty_cell?
    @placement_coordinates.all? do |key|
      cell = @cells[key]
        cell.ship == 0
      end
  end

  def no_overlap?(coordinate)
    @placement_coordinates.include?(coordinate)
  end

  def render(show = false)
    if show == true
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C3"].render(true)} #{@cells["C3"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    else
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
      "C #{@cells["C3"].render} #{@cells["C3"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
      end
    end
  end
