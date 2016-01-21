class Board
  attr_reader :pieces

  RANKS = (1..8).to_a
  FILES = ('a'..'h').to_a

  def initialize
    @pieces = []
  end
end
