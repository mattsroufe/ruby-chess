class StartGame
  POSITIONS = {::Castle => 'a1', ::Bishop => 'a2'}

  def call
    POSITIONS.map do |k, v|
      k.new(v)
    end
  end
end
