require_relative 'grid.rb'

class Game
  def nextiterationlivecell?(_celldetails)
    if _celldetails[1]
      nextiterationiflivecell?(_celldetails[0])
    else
      nextiterationifnotlivecell?(_celldetails[0])
    end
  end

  private

  def nextiterationiflivecell?(neighbournumber)
    neighbournumber == 2 || neighbournumber == 3
  end

  def nextiterationifnotlivecell?(neighbournumber)
    neighbournumber == 3
  end
end
