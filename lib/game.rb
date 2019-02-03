require_relative 'grid.rb'

class Game
  def nextiterationlivecell?(_celldetails)
    if _celldetails[1]
      true
    else
      _celldetails[0] == 3
    end
  end
end
