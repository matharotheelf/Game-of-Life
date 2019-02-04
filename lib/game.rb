require_relative 'grid.rb'

class Game
  def iterate(gridbefore, gridafter = Grid.new)
    addtogrid(gridbefore, gridafter) unless isgridnil?(gridbefore)
    gridafter
  end

  private

  def nextiterationlivecell?(_celldetails)
    if _celldetails[1]
      nextiterationiflivecell?(_celldetails[0])
    else
      nextiterationifnotlivecell?(_celldetails[0])
    end
  end

  def addtogrid(_gridbefore, _gridafter)
    _gridbefore.livecellneighbournumberhash.each do |key, array|
      _gridafter.addlivecell(key[0], key[1]) if nextiterationlivecell?(array)
    end
  end

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
