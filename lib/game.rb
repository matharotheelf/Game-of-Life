require_relative 'grid.rb'

class Game
  def nextiterationlivecell?(_celldetails)
    if _celldetails[1]
      _celldetails[0] == 2 || _celldetails[0] == 3
    else
      _celldetails[0] == 3
    end
  end
end
