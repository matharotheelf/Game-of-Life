require 'grid'

describe Grid do
  grid = Grid.new

  describe '#addlivecell' do
    let(:livecell) { double :livecell }

    it 'can add cell to grid' do
      expect { grid.addlivecell(livecell) }.to change { grid.livecellsarray.length }.by(1)
    end
  end
end
