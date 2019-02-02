require 'grid'

describe Grid do
  grid = Grid.new

  describe '#addlivecell' do
    let(:livecell) { double :livecell }
    let(:xcoordinate) { double :xcoordinate }
    let(:ycoordinate) { double :ycoordinate }

    it 'can add cell to grid' do
      expect { grid.addlivecell(xcoordinate, ycoordinate, livecell) }.to change { grid.livecellsarray.length }.by(1)
    end
  end

  describe '#nearestneighbournumber' do
    it 'returns 0 if no nearest neighbours' do
      expect(grid.nearestneighbournumber([0, 0])).to eq 0
    end
  end
end
