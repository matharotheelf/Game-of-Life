require 'livecell'

describe Livecell do
  describe '#coordinate' do
    let(:xcoordinate) { double :xcoordinate }
    let(:ycoordinate) { double :ycoordinate }
    it 'returns coordinate of livecell' do
      livecell = Livecell.new(xcoordinate, ycoordinate)
      expect(livecell.coordinate).to eq([xcoordinate, ycoordinate])
    end
  end
end
