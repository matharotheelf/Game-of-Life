class Grid
  attr_reader :livecellsarray

  def initialize
    @livecellsarray = []
  end

  def addlivecell(livecell)
    @livecellsarray.push(livecell)
  end
end
