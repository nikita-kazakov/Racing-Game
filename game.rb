require_relative 'car'
require_relative 'game_modules'

class Game

  def initialize
    @cars = []
  end

  def addCars(car)
    @cars << car
  end


  def play


    1.upto(10) do |count|

      puts "\nRound - #{count}"
      puts "Track Distance: #{Features::track_distance} miles"

      @cars.each  do |car|
        car.dieroll = Features::die_roll
        car.travel
        puts "#{car.name}: Dice Roll: #{car.dieroll} Cum Distance: #{car.traveled} Engine: #{car.engine}. Track Completed %: #{car.traveled} mi out of #{Features::track_distance} mi. Finished? #{car.finished?}"
        car.add_powerup(Powerups::random)
        puts "#{car.name} got a #{car.powerups}"

      end

    end

  end


end


if __FILE__ == $0

  #Instantiate Cars
  car1 = Car.new("Car1", 100)
  car2 = Car.new("Car2",100)

  #Instantiate Game
  game1 = Game.new

  #Add Cars to Game
  game1.addCars(car1)
  game1.addCars(car2)

  #Add Tracks to Game


  game1.play

end