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
    neighbournumber = 0
    livecellsarray.each do |element|
      if (element.coordinate[0] - _coordinate[0]).between?(-1, 1) && (element.coordinate[1] - _coordinate[1]).between?(-1, 1) && !((element.coordinate[0] - _coordinate[0]) == 0 && (element.coordinate[1] - _coordinate[1]) == 0)
        neighbournumber += 1
      end
    end
    neighbournumber
  end
end
