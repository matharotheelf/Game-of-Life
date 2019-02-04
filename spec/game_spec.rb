require 'game'

describe Game do
  before do
    @game = Game.new
  end

  describe '#nextiterationlivecell?' do
    it 'returns false if not live cell and not three neighbours' do
      expect(@game.nextiterationlivecell?([0, false])).to eq(false)
    end

    it 'returns true if not live cell and three neighbours' do
      expect(@game.nextiterationlivecell?([3, false])).to eq(true)
    end

    it 'returns true if live cell and two neighbours' do
      expect(@game.nextiterationlivecell?([2, true])).to eq(true)
    end

    it 'returns false if live cell and one neighbours' do
      expect(@game.nextiterationlivecell?([1, true])).to eq(false)
    end

    it 'returns true if live cell and three neighbours' do
      expect(@game.nextiterationlivecell?([3, true])).to eq(true)
    end
  end

  describe '#iterate' do
    let(:gridbefore) { double :gridbefore }

    it 'returns correct next iteration if seeded' do
      gridafter = spy('gridafter')
      allow(gridbefore).to receive(:livecellneighbournumberhash) {
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
      @game.iterate(gridbefore, gridafter)
      expect(gridafter).to have_received(:addlivecell).with(0, 0)
      expect(gridafter).to have_received(:addlivecell).with(0, 1)
      expect(gridafter).to have_received(:addlivecell).with(0, -1)
    end
  end
end
