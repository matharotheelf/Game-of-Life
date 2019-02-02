require 'grid'

describe Grid do
  describe '#addlivecell' do
    it 'is defined on Grid class' do
      grid = Grid.new
      expect(grid).to respond_to(:addlivecell)
    end
  end
end
