class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name.to_s
    @marker = marker.to_s
  end
end
