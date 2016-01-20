class Piece
  POSITIONS = {::Castle => 'a1', ::Bishop => 'a2'}

  def initialize(position)
    @position = position
  end

  def self.build
    []
    POSITIONS.map do |k, v|
      k.new(v)
    end
  end
end
