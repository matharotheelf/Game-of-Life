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
end
