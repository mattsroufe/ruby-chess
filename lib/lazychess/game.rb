class Game
  attr_reader :board, :players

  def initialize
    @board ||= Board.new
    @players = [Player.new] * 2
  end

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end
end
