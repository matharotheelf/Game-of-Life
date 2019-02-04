require_relative 'grid.rb'

class Game
  def nextiterationlivecell?(_celldetails)
    if _celldetails[1]
      nextiterationiflivecell?(_celldetails[0])
    else
      nextiterationifnotlivecell?(_celldetails[0])
    end
  end

  def iterate(gridbefore, gridafter = Grid.new)
    unless isgridnil?(gridbefore)
      gridbefore.livecellneighbournumberhash.each do |key, array|
        gridafter.addlivecell(key[0], key[1]) if nextiterationlivecell?(array)
      end
    end
  end

  private

  def isgridnil?(_grid)
    _grid.livecellneighbournumberhash.nil?
  end

  def nextiterationiflivecell?(_neighbournumber)
    _neighbournumber == 2 || _neighbournumber == 3
  end

  def nextiterationifnotlivecell?(_neighbournumber)
    _neighbournumber == 3
  end
end
