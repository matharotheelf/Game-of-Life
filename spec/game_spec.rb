require 'game'

describe Game do
  before do
    @game = Game.new
  end

  describe '#nextiterationlivecell?' do
    it 'returns false if not live cell and no neighbours' do
      expect(@game.nextiterationlivecell?([0, false])).to eq(false)
    end
  end
end
