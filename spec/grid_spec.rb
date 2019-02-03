require 'grid'

describe Grid do
  before do
    @grid = Grid.new
  end

  describe '#addlivecell' do
    let(:livecell) { double :livecell }
    let(:xcoordinate) { double :xcoordinate }
    let(:ycoordinate) { double :ycoordinate }

    it 'can add cell to grid' do
      expect { @grid.addlivecell(xcoordinate, ycoordinate, livecell) }.to change { @grid.livecellsarray.length }.by(1)
    end
  end

  describe '#livecellneighbournumberhash' do
    let(:livecell1) { double :livecell1 }
    let(:livecell2) { double :livecell2 }

    it 'creates hash for single live cell' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.livecellneighbournumberhash).to include([0, 0] => [0, true],
                                                           [0, 1] => [1, false],
                                                           [0, -1] => [1, false],
                                                           [-1, -1] => [1, false],
                                                           [-1, 0] => [1, false],
                                                           [-1, 1] => [1, false],
                                                           [1, -1] => [1, false],
                                                           [1, 0] => [1, false],
                                                           [1, 1] => [1, false])
    end

    it 'creates hash for multiple live cells' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      allow(livecell2).to receive(:coordinate) { [1, 1] }
      @grid.addlivecell(nil, nil, livecell2)
      expect(@grid.livecellneighbournumberhash).to include([-1, -1] => [1, false],
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
                                                           [2, 2] => [1, false])
    end

    it 'returns nil if no live cells' do
      expect(@grid.livecellneighbournumberhash).to eq(nil)
    end
  end
end
