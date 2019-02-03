require_relative 'livecell.rb'

class Grid
  attr_reader :livecellsarray

  def initialize
    @livecellsarray = []
  end

  def addlivecell(x, y, livecell = Livecell.new(x, y))
    @livecellsarray.push(livecell)
  end

  def extentnextgeneration
    if livecellsarray.empty?
      { max: nil, min: nil }
    else
      { max: maxextentcalculator, min: minextentcalculator }
    end
  end

  def nearestneighbournumber(_coordinate)
    neighbournumber = 0
    livecellsarray.each do |element|
      neighbournumber += 1 if isnexto?(element, _coordinate)
    end
    neighbournumber
  end

  private

  def maxextentcalculator
    [coordinatearray[0].max + 1, coordinatearray[1].max + 1]
  end

  def minextentcalculator
    [coordinatearray[0].min - 1, coordinatearray[1].min - 1]
  end

  def coordinatearray
    xcoordinates = []
    ycoordinates = []
    livecellsarray.each do |element|
      xcoordinates.push(element.coordinate[0])
      ycoordinates.push(element.coordinate[1])
    end
    [xcoordinates, ycoordinates]
  end

  def isnexto?(_element, _coordinate)
    difx = _element.coordinate[0] - _coordinate[0]
    dify = _element.coordinate[1] - _coordinate[1]
    difx.between?(-1, 1) && dify.between?(-1, 1) && !(difx == 0 && dify == 0)
  end
end
