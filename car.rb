
class Car

  attr_reader :name, :health, :color, :ignition, :speed
  attr_writer :name, :ignition, :speed, :health

  #I put down a default value of "NoName in-case you forget to pass name parameter"
  def initialize(name="NoName")
    @name = name.capitalize
    @health = 100
    @color = "black".capitalize
    @ignition = false
    @speed = 0
  end

  #Methods below

  def ignitionOn

    if ignition == false
      @ignition = true
      puts "Vroom Vroom...Car has turned on! Ignition = #{ignition}"
    else
      puts "The car was already on. Ignition = #{ignition}"
    end

  end

  def ignitionOff

    if ignition == false
      puts "The car is already off! Ignition = #{ignition}"
    else
      @ignition = false
      puts "The car just turned off. Ignition = #{ignition}"
    end

  end

  def stats
    "Car name: #{name}.  Color: #{color}.  Health: #{health}. Ignition: #{ignition}. Speed: #{speed}"
  end

  def velocityIncrease
    @speed += 5
    puts "Velocity Increased! Speed = #{speed}"
  end

  def velocityDecrease
    @speed -= 5
    puts "Velocity Decreased! Speed = #{speed}"
  end

end



if __FILE__  == $0
  #Sample Code for Car Class

  car1 = Car.new("Ford")
  puts car1.stats
  car1.ignitionOn
  car1.ignitionOn
  car1.ignitionOn
  car1.ignitionOff
  car1.ignitionOff
  car1.velocityIncrease
  car1.velocityIncrease
  car1.velocityIncrease
  car1.velocityDecrease
end