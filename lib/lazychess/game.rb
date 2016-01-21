class Game
  attr_reader :board, :player_one, :player_two

  def initialize
    @board ||= Board.new
    @player_one = Player.new
    @player_two = Player.new
  end

  def players
    [player_one, player_two]
  end
end
