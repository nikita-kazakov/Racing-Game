Star = Struct.new(:item, :points)

module Powerups

  Stars = [
      Star.new(:bronze, 1),
      Star.new(:silver, 2),
      Star.new(:gold, 3)
  ]

  def self.random
    Stars.sample
  end

end


module Gameplay

end


module Features

  def self.die_roll
    #rand(1..3)
    1
  end

  def self.track_distance
    200
  end

end

if __FILE__ == $0

 puts Powerups::random

end