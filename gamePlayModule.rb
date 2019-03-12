module GamePlayModule

  def self.die_roll
    rand(1..3)
  end

  def self.turn(cars)
    dievalue = die_roll
    puts "Everyone loses 10 health. Car # #{dievalue} gains +20 health."
    cars[dievalue - 1].health += 20

    cars.each do |car|
      car.health -= 10
      puts car.stats
    end
  end

end