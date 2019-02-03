require_relative 'livecell.rb'

class Grid
  attr_reader :livecellsarray

  def initialize
    @livecellsarray = []
  end

  def addlivecell(x, y, livecell = Livecell.new(x, y))
    @livecellsarray.push(livecell)
  end

  def nearestneighbournumber(_coordinate)
    if livecellsarray.empty?
      0
    else
      1
    end
  end
end
