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

      all_valid?
      # no_diagonals
      consecutive_method

  end

  def consecutive_method
    @placement_coordinates.each do |coordinate|
        @columns << coordinate.slice(1)
        @rows << coordinate.slice(0)
        # binding.pry
    end

    rows_sorted = @rows.sort.uniq
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



    # if rows_sorted.length == 1
    #     rows_good = true
    # elsif
    #     rows_sorted == rows_range_array
    #     rows_good = true
    # else
    #     rows_good = false
    # end

    columns_sorted = @columns.sort.uniq
      x = columns_sorted[0]
      y = columns_sorted[-1]
    column_range_array = (x..y).to_a

columns_sorted_ctally = columns_sorted[0]

        columns_sorted.all? do |num|
          num + 1 == columns_sorted_ctally += 1
        end

    # if columns_sorted.length == 1
    #     columns_good = true
    #   elsif
    #     columns_sorted == column_range_array
    #     columns_good = true
    #   else
    #     columns_good = false
    # end
    #
    # return false if rows_good != true || columns_good != true
  end



  def no_diagonals
    if @rows.uniq.length == 1
      @columns.uniq.length == 1
  end


end
# return false if columns_sorted != column_range_array &&
#                 rows_sorted != rows_range_array
# return false if columns_sorted == column_range_array &&
#                 rows_sorted == rows_range_array
# if rows_sorted.uniq != 1 && rows_sorted == rows_range_array
#
# # columns_sorted.uniq != 1 && columns_sorted == column_range_array
