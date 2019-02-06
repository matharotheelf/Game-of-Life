require 'grid'

describe Grid do
  before do
    @grid = Grid.new
  end

  describe '#add_livecell' do
    let(:livecell) { double :livecell }

    it 'can add cell to grid' do
      allow(livecell).to receive(:coordinate) { [0, 0] }
      expect { @grid.add_livecell(nil, nil, livecell) }.to change {
                                                             @grid.livecells_array.length
                                                           }.by(1)
    end

    it 'will not add live cell to list if one exists at coordinate' do
      allow(livecell).to receive(:coordinate) { [0, 0] }
      @grid.add_livecell(nil, nil, livecell)
      expect { @grid.add_livecell(nil, nil, livecell) }.to change {
                                                             @grid.livecells_array.length
                                                           }.by(0)
    end
  end

  describe '#livecellneighbournumberhash' do
    let(:livecell1) { double :livecell1 }
    let(:livecell2) { double :livecell2 }

    it 'creates hash for single live cell' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.add_livecell(nil, nil, livecell1)
      expect(@grid.livecell_neighbour_number_hash).to include(
        [0, 0] => [0, true],
        [0, 1] => [1, false],
        [0, -1] => [1, false],
        [-1, -1] => [1, false],
        [-1, 0] => [1, false],
        [-1, 1] => [1, false],
        [1, -1] => [1, false],
        [1, 0] => [1, false],
        [1, 1] => [1, false]
      )
    end

    it 'creates hash for multiple live cells' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.add_livecell(nil, nil, livecell1)
      allow(livecell2).to receive(:coordinate) { [1, 1] }
      @grid.add_livecell(nil, nil, livecell2)
      expect(@grid.livecell_neighbour_number_hash).to include(
        [-1, -1] => [1, false],
        [-1, 0] => [1, false],
        [-1, 1] => [1, false],
        [-1, 2] => [0, false],
        [0, -1] => [1, false],
        [0, 0] => [1, true],
        [0, 1] => [2, false],
        [0, 2] => [1, false],
        [1, -1] => [1, false],
        [1, 0] => [2, false],
        [1, 1] => [1, true],
        [1, 2] => [1, false],
        [2, -1] => [0, false],
        [2, 0] => [1, false],
        [2, 1] => [1, false],
        [2, 2] => [1, false]
      )
    end

    it 'returns nil if no live cells' do
      expect(@grid.livecell_neighbour_number_hash).to eq(nil)
    end
  end
end
