#Racing Game

#Step 1: Create Car
#Step 2: Car has

class Car

  attr_reader :name, :health, :color,:ignition, :speed
  attr_writer :name, :ignition, :speed

  def initialize(name)
    @name = name.capitalize
    @health = 100
    @color = "black".capitalize
    @ignition = false
    @speed = 0
  end

  #No need for getter and setter methods as I used attr_reader and attr_writer.


  #Methods below

  def ignitionOn

    if ignition == false
      self.ignition = true
      puts "Vroom Vroom...Car has turned on! Ignition = #{ignition}"
    else
      puts "The car was already on. Ignition = #{ignition}"
    end

  end

  def ignitionOff

    if ignition == false
      puts "The car is already off! Ignition = #{ignition}"
    else
      self.ignition = false
      puts "The car just turned off. Ignition = #{ignition}"
    end

  end


  def stats
    puts "Car name: #{name}.    Color: #{color}.    Health: #{health}"
  end

  def velocityIncrease
    self.speed = 5
    puts "Velocity Increased! Speed = #{@speed}"
  end

end

car1 = Car.new("Ford")
puts car1.stats
puts car1.ignition
car1.ignitionOn
puts car1.ignition
car1.ignitionOn
car1.ignitionOn
car1.ignitionOff
car1.ignitionOff
car1.velocityIncrease
car1.velocityIncrease
car1.velocityIncrease
