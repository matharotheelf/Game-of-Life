require 'game.rb'

describe 'User journeys' do
  before do
    @game = Game.new
    @grid_zero = Grid.new
  end

  it 'scenario 5: empty game grid will remain empty' do
    grid_one = @game.iterate(@grid_zero)
    expect(grid_one.livecells_array).to eq([])
  end

  it 'scenario 6: seeded grid will oscillate' do
    @grid_zero.add_livecell(-1, 0)
    @grid_zero.add_livecell(0, 0)
    @grid_zero.add_livecell(1, 0)
    grid_one = @game.iterate(@grid_zero)
    livecellarrayone = [grid_one.livecells_array[0].coordinate,
                        grid_one.livecells_array[1].coordinate,
                        grid_one.livecells_array[2].coordinate]
    expect(livecellarrayone).to include([0, -1], [0, 0], [0, 1])
    grid_two = @game.iterate(grid_one)
    livecellarraytwo = [grid_two.livecells_array[0].coordinate,
                        grid_two.livecells_array[1].coordinate,
                        grid_two.livecells_array[2].coordinate]
    expect(livecellarraytwo).to include([-1, 0], [0, 0], [1, 0])
  end
end
