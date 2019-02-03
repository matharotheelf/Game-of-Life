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

  describe '#nearestneighbournumber' do
    let(:livecell1) { double :livecell1 }
    let(:livecell2) { double :livecell2 }

    it 'returns 0 if no nearest neighbours' do
      expect(@grid.nearestneighbournumber([0, 0])).to eq 0
    end

    it 'returns 0 if no nearest neighbours but one further away' do
      allow(livecell2).to receive(:coordinate) { [0, 2] }
      @grid.addlivecell(nil, nil, livecell2)
      expect(@grid.nearestneighbournumber([0, 0])).to eq 0
    end

    it 'returns 1 if 1 nearest neighbour' do
      allow(livecell1).to receive(:coordinate) { [0, 1] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.nearestneighbournumber([0, 0])).to eq 1
    end
  end
end
