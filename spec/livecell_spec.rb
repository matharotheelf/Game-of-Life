require 'livecell'

describe Livecell do
  describe '#coordinate' do
    let(:x_coordinate) { double :x_coordinate }
    let(:y_coordinate) { double :y_coordinate }
    it 'returns coordinate of livecell' do
      livecell = Livecell.new(x_coordinate, y_coordinate)
      expect(livecell.coordinate).to eq([x_coordinate, y_coordinate])
    end
  end
end
