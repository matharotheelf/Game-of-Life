require 'game'

describe Game do
  before do
    @game = Game.new
  end

  describe '#nextiterationlivecell?' do
    it 'returns false if not live cell and less than three neighbours' do
      expect(@game.nextiterationlivecell?([0, false])).to eq(false)
    end

    it 'returns true if not live cell and three neighbours' do
      expect(@game.nextiterationlivecell?([3, false])).to eq(true)
    end
  end
end
