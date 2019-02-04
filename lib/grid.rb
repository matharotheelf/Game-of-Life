require_relative 'livecell.rb'

class Grid
  attr_reader :livecells_array

  def initialize
    @livecells_array = []
  end

  def add_livecell(x, y, livecell = Livecell.new(x, y))
    add_to_livecells_array(livecell) unless is_livecell?(livecell.coordinate)
  end

  def livecell_neighbour_number_hash
    if livecell_array_empty?
      nil
    else
      create_hash
    end
  end

  private

  def add_to_livecells_array(livecell)
    @livecells_array.push(livecell)
  end

  def create_hash
    hash = {}
    x_extent_range.each do |x|
      y_extent_range.each do |y|
        hash[[x, y]] = hash_entry(x, y)
      end
    end
    hash
  end

  def extent_next_generation
    if livecell_array_empty?
      { max: nil, min: nil }
    else
      { max: max_extent_calculator, min: min_extent_calculator }
    end
  end

  def nearest_neighbour_number(_coordinate)
    neighbour_number = 0
    livecells_array.each do |element|
      neighbour_number += 1 if is_next_to?(element, _coordinate)
    end
    neighbour_number
  end

  def is_livecell?(_coordinate)
    is_livecell = false
    livecells_array.each do |element|
      is_livecell = true if element.coordinate == _coordinate
    end
    is_livecell
  end

  def hash_entry(x, y)
    [nearest_neighbour_number([x, y]), is_livecell?([x, y])]
  end

  def x_extent_range
    extent_next_generation[:min][0]...extent_next_generation[:max][0] + 1
  end

  def y_extent_range
    extent_next_generation[:min][1]...extent_next_generation[:max][1] + 1
  end

  def livecell_array_empty?
    livecells_array.empty?
  end

  def max_extent_calculator
    [coordinate_array[0].max + 1, coordinate_array[1].max + 1]
  end

  def min_extent_calculator
    [coordinate_array[0].min - 1, coordinate_array[1].min - 1]
  end

  def coordinate_array
    x_coordinates = []
    y_coordinates = []
    livecells_array.each do |element|
      x_coordinates.push(element.coordinate[0])
      y_coordinates.push(element.coordinate[1])
    end
    [x_coordinates, y_coordinates]
  end

  def is_next_to?(_element, _coordinate)
    difx = _element.coordinate[0] - _coordinate[0]
    dify = _element.coordinate[1] - _coordinate[1]
    difx.between?(-1, 1) && dify.between?(-1, 1) && !(difx == 0 && dify == 0)
  end
end
