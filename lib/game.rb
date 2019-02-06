require_relative 'grid.rb'

# class which generates grid of the next iteration so manages the game
class Game
  def iterate(grid_before, grid_after = Grid.new)
    add_to_grid(grid_before, grid_after) unless grid_nil?(grid_before)
    grid_after
  end

  private

  def next_iteration_livecell?(cell_details)
    if cell_details[1]
      next_iteration_if_livecell?(cell_details[0])
    else
      next_iteration_if_not_livecell?(cell_details[0])
    end
  end

  def add_to_grid(grid_before, grid_after)
    grid_before.livecell_neighbour_number_hash.each do |key, array|
      grid_after.add_livecell(key[0], key[1]) if next_iteration_livecell?(array)
    end
  end

  def grid_nil?(grid)
    grid.livecell_neighbour_number_hash.nil?
  end

  def next_iteration_if_livecell?(neighbour_number)
    [2, 3].include?(neighbour_number)
  end

  def next_iteration_if_not_livecell?(neighbour_number)
    neighbour_number == 3
  end
end
