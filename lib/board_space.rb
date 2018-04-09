require_relative "board"
require_relative "turn"
require_relative "player"

class BoardSpace
  attr_accessor :cell, :character

  def initialize(cell = nil)
    @cell = cell
  end

  def occupied?
    !@cell.nil?
  end

  def to_char
    if @cell
      " #{@cell.character} "
    else
      '   '
    end
  end
end
