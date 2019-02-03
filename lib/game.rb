require_relative 'grid.rb'

class Game
  def nextiterationlivecell?(_celldetails)
    _celldetails[0] == if _celldetails[1]
                         2
                       else
                         3
                       end
  end
end
