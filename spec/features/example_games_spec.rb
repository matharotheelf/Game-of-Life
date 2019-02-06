require 'game.rb'

describe 'User journeys' do
  it 'empty game grid will remain empty' do
    game = Game.new
    grid_zero = Grid.new
    grid_one = game.iterate(grid_zero)
    expect(grid_one.livecells_array).to eq([])
  end
end
