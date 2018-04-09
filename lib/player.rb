require_relative "board_space"

class Player
  attr_accessor :player, :character

  def initialize(player, character)
    @player = player
    @character = character
  end
end
