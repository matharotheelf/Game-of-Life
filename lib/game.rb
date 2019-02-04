require_relative 'grid.rb'

class Game
  def iterate(grid_before, grid_after = Grid.new)
    add_to_grid(grid_before, grid_after) unless is_grid_nil?(grid_before)
    grid_after
  end

  private

  def next_iteration_livecell?(_cell_details)
    if _cell_details[1]
      next_iteration_if_livecell?(_cell_details[0])
    else
      next_iteration_if_not_livecell?(_cell_details[0])
    end
  end

  def add_to_grid(_grid_before, _grid_after)
    _grid_before.livecell_neighbour_number_hash.each do |key, array|
      _grid_after.add_livecell(key[0], key[1]) if next_iteration_livecell?(array)
    end
  end

  def is_grid_nil?(_grid)
    _grid.livecell_neighbour_number_hash.nil?
  end

  def next_iteration_if_livecell?(_neighbour_number)
    _neighbour_number == 2 || _neighbour_number == 3
  end

  def next_iteration_if_not_livecell?(_neighbour_number)
    _neighbour_number == 3
  end
end
