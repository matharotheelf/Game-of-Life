require 'game'

describe Game do
  before do
    @game = Game.new
  end

  describe '#iterate' do
    let(:grid_before) { double :grid_before }

    it 'returns correct next iteration if seeded' do
      grid_after = spy('grid_after')
      allow(grid_before).to receive(:livecell_neighbour_number_hash) {
                              { [-2, -1] => [1, false],
                                [-2, 0] => [1, false],
                                [-2, 1] => [1, false],
                                [-1, -1] => [2, false],
                                [-1, 0] => [1, true],
                                [-1, 1] => [2, false],
                                [0, -1] => [3, false],
                                [0, 0] => [2, true],
                                [0, 1] => [3, false],
                                [1, -1] => [2, false],
                                [1, 0] => [1, true],
                                [1, 1] => [2, false],
                                [2, -1] => [1, false],
                                [2, 0] => [1, false],
                                [2, 1] => [1, false] }
                            }
      @game.iterate(grid_before, grid_after)
      expect(grid_after).to have_received(:add_livecell).with(0, 0)
      expect(grid_after).to have_received(:add_livecell).with(0, 1)
      expect(grid_after).to have_received(:add_livecell).with(0, -1)
    end

    it 'calculates correctly if livecell is surrounded by three others' do
      grid_after = spy('grid_after')
      allow(grid_before).to receive(:livecell_neighbour_number_hash) {
                              { [-1, -1] => [1, false],
                                [-1, 0] => [2, false],
                                [-1, 1] => [2, false],
                                [-1, 2] => [1, false],
                                [0, -1] => [2, false],
                                [0, 0] => [3, true],
                                [0, 1] => [3, true],
                                [0, 2] => [2, false],
                                [1, -1] => [2, false],
                                [1, 0] => [3, true],
                                [1, 1] => [3, true],
                                [1, 2] => [2, false],
                                [2, -1] => [1, false],
                                [2, 0] => [2, false],
                                [2, 1] => [2, false],
                                [2, 2] => [1, false] }
                            }
      @game.iterate(grid_before, grid_after)
      expect(grid_after).to have_received(:add_livecell).with(0, 0)
      expect(grid_after).to have_received(:add_livecell).with(0, 1)
      expect(grid_after).to have_received(:add_livecell).with(1, 1)
      expect(grid_after).to have_received(:add_livecell).with(1, 0)
    end

    it 'Generates empty grid next iteration if empty' do
      grid_after = spy('grid_after')
      allow(grid_before).to receive(:livecell_neighbour_number_hash) { nil }
      @game.iterate(grid_before, grid_after)
      expect(grid_after).to have_received(:add_livecell).exactly(0).times
    end

    context 'testing to see if newly created grid returned' do
      let(:grid_after) { double :grid_after }

      it 'reuturns newly created grid' do
        allow(grid_before).to receive(:livecell_neighbour_number_hash) { nil }
        expect(@game.iterate(grid_before, grid_after)).to eq(grid_after)
      end
    end
  end
end
