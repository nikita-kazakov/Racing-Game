require_relative 'game_modules'

class Car

  attr_accessor :name, :engine, :traveled, :dieroll, :powerups

  def initialize(name, engine)
    @name = name
    @engine = engine
    @traveled = 0
    @powerups = Hash.new(0)
    @dieroll = 0
    @finished = false

  end


  def travel
    @traveled = @traveled + (@engine / 10) + (@dieroll*10)
  end

  def percent_track_completed
    (@traveled / Features::track_distance) * 100
  end

  def finished?
    @traveled >= Features::track_distance
  end

  def add_powerup(item)
    @powerups[item.item] += item.points
  end

end

#sample code
if __FILE__ == $0
  car0 = Car.new("ford", 100)

end