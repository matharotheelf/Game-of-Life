require_relative 'grid.rb'

class Game
  def nextiterationlivecell?(_celldetails)
    _celldetails[0] == 3
  end
end
