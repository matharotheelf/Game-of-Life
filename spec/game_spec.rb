require 'game'

describe Game do
  before do
    @game = Game.new
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

    it 'returns correct next iteration if seeded with array testing if livecell surrounded by three others stays alive' do
      gridafter = spy('gridafter')
      allow(gridbefore).to receive(:livecellneighbournumberhash) {
                             { [-1, -1] => [1, false],
                               [-1, 0] => [2, false],
                               [-1, 1] => [2, false],
                               [-1, 2] => [1, false],
                               [0, -1] => [2, false],
                               [0, 0] => [3, true],
                               [0, 1] => [3, true],
                               [0, 2] => [2, false],
                               [1, -1] => [2, false],
                               [1, 0] => [3, true],
                               [1, 1] => [3, true],
                               [1, 2] => [2, false],
                               [2, -1] => [1, false],
                               [2, 0] => [2, false],
                               [2, 1] => [2, false],
                               [2, 2] => [1, false] }
                           }
      @game.iterate(gridbefore, gridafter)
      expect(gridafter).to have_received(:addlivecell).with(0, 0)
      expect(gridafter).to have_received(:addlivecell).with(0, 1)
      expect(gridafter).to have_received(:addlivecell).with(1, 1)
      expect(gridafter).to have_received(:addlivecell).with(1, 0)
    end

    it 'Generates empty grid next iteration if empty' do
      gridafter = spy('gridafter')
      allow(gridbefore).to receive(:livecellneighbournumberhash) { nil }
      @game.iterate(gridbefore, gridafter)
      expect(gridafter).to have_received(:addlivecell).exactly(0).times
    end

    context 'testing to see if newly created grid returned' do
      let(:gridafter) { double :gridafter }

      it 'reuturns newly created grid' do
        allow(gridbefore).to receive(:livecellneighbournumberhash) { nil }
        expect(@game.iterate(gridbefore, gridafter)).to eq(gridafter)
      end
    end
  end
end
