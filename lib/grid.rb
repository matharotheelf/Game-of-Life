require_relative 'livecell.rb'

class Grid
  attr_reader :livecellsarray

  def initialize
    @livecellsarray = []
  end

  def addlivecell(x, y, livecell = Livecell.new(x, y))
    addtolivecellsarray(livecell) unless islivecell?(livecell.coordinate)
  end

  def livecellneighbournumberhash
    if livecellarrayempty?
      nil
    else
      createhash
    end
  end

  private

  def addtolivecellsarray(livecell)
    @livecellsarray.push(livecell)
  end

  def createhash
    hash = {}
    xextentrange.each do |x|
      yextentrange.each do |y|
        hash[[x, y]] = hashentry(x, y)
      end
    end
    hash
  end

  def extentnextgeneration
    if livecellarrayempty?
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

  def islivecell?(_coordinate)
    islivecell = false
    livecellsarray.each do |element|
      islivecell = true if element.coordinate == _coordinate
    end
    islivecell
  end

  def hashentry(x, y)
    [nearestneighbournumber([x, y]), islivecell?([x, y])]
  end

  def xextentrange
    extentnextgeneration[:min][0]...extentnextgeneration[:max][0] + 1
  end

  def yextentrange
    extentnextgeneration[:min][1]...extentnextgeneration[:max][1] + 1
  end

  def livecellarrayempty?
    livecellsarray.empty?
  end

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
