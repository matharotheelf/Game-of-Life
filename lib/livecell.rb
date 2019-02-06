# class which generates and stores livecells and their coordinates
class Livecell
  attr_reader :coordinate

  def initialize(xcoordinate, ycoordinate)
    @coordinate = [xcoordinate, ycoordinate]
  end
end
