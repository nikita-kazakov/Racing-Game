class Car

  attr_accessor :name, :engine, :speed, :cumDistance

  def initialize(name, engine)
    @name = name
    @engine = engine
    @speed = 0
    @cumDistance = 0
  end

end