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

    it 'returns 0 if no nearest neighbours but one further away' do
      allow(livecell1).to receive(:coordinate) { [0, 2] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.nearestneighbournumber([0, 0])).to eq 0
    end

    it 'returns 1 if 1 nearest neighbour' do
      allow(livecell1).to receive(:coordinate) { [0, 1] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.nearestneighbournumber([0, 0])).to eq 1
    end

    it 'returns 2 if 2 nearest neighbours' do
      allow(livecell1).to receive(:coordinate) { [1, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      allow(livecell2).to receive(:coordinate) { [0, 1] }
      @grid.addlivecell(nil, nil, livecell2)
      expect(@grid.nearestneighbournumber([0, 0])).to eq 2
    end

    it 'returns 1 if 1 neighbour and 1 live cell at same coordinate' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      allow(livecell2).to receive(:coordinate) { [0, 1] }
      @grid.addlivecell(nil, nil, livecell2)
      expect(@grid.nearestneighbournumber([0, 0])).to eq 1
    end
  end

  describe '#extentnextgeneration' do
    let(:livecell1) { double :livecell1 }
    let(:livecell2) { double :livecell2 }

    it 'returns correct extent for single live cell' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.extentnextgeneration).to include(max: [1, 1], min: [-1, -1])
    end

    it 'returns correct extent for multiple living cells' do
      allow(livecell1).to receive(:coordinate) { [1, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      allow(livecell2).to receive(:coordinate) { [0, 1] }
      @grid.addlivecell(nil, nil, livecell2)
      expect(@grid.extentnextgeneration).to include(max: [2, 2], min: [-1, -1])
    end

    it 'returns response if no living cells' do
      expect(@grid.extentnextgeneration).to include(max: nil, min: nil)
    end
  end

  describe '#islivecell?' do
    let(:livecell1) { double :livecell1 }
    let(:livecell2) { double :livecell2 }

    it 'reuturns false if not a live cell and no live cells' do
      expect(@grid.islivecell?([0, 0])).to eq false
    end

    it 'reuturns true if live cell at same coordinate' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.islivecell?([0, 0])).to eq true
    end

    it 'reuturns false if live cell exists but at different coordinate' do
      allow(livecell1).to receive(:coordinate) { [0, 0] }
      @grid.addlivecell(nil, nil, livecell1)
      expect(@grid.islivecell?([0, 1])).to eq false
    end

    # it 'returns true if one of two live cells exists at coordinate' do
    #   allow(livecell1).to receive(:coordinate) { [0, 0] }
    #   @grid.addlivecell(nil, nil, livecell1)
    #   allow(livecell2).to receive(:coordinate) { [0, 1] }
    #   @grid.addlivecell(nil, nil, livecell2)
    #   expect(@grid.islivecell?([0, 1])).to eq true
    # end
  end
end
