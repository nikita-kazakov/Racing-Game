#Racing Game

#Step 1: Create Car
#Step 2: Car has

class Car

  attr_reader :name, :health, :color, :ignition, :speed
  attr_writer :name, :ignition, :speed

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
    puts "Car name: #{name}.  Color: #{color}.  Health: #{health}. Ignition: #{ignition}. Speed: #{speed}"
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


#Let's create a player class
class Player

  attr_reader :name, :money, :multiplier
  attr_writer :name_

  def initialize(name)
    @name = name
    @money = 10000
    @multiplier = 1
  end

  def stats
    "Player: #{name}. Money: #{money}. Multiplier: #{multiplier}"
  end

end

player1 = Player.new("Jimmy")
player2 = Player.new("Rico")
player3 = Player.new("Bobby")
