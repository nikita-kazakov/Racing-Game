require_relative 'car'
require_relative 'track'
require_relative 'gameItems'

class Game

  def initialize
    @cars = []
    @track
  end

  def addCars(car)
    @cars << car
  end

  def addTrack(track)
    @track = track
  end


  def percent_complete

  end

  def die_roll
    rand(1..3)
  end


  def play(timeIntervals)

  1.upto(timeIntervals) do |count|

    puts "\nRound - #{count}"
    @cars.each  do |car|
      #car speed is dice rolled multiplied by 10 plus ENGINE divided by 10
      car.speed = car.speed + (die_roll*10) + (car.engine / 10)
      car.cumDistance = car.speed * timeIntervals
      puts "#{car.name}: Speed: #{car.speed}. Dice Roll: #{die_roll} Cum Dist: #{car.cumDistance} Engine: #{car.engine}. Track Completed %: #{(car.cumDistance.to_f / @track.length)*100}"
    end

  end

  end




end


if __FILE__ == $0

  #Instantiate Cars
  car1 = Car.new("Car1", 100)
  car2 = Car.new("Car2",120)
  car3 = Car.new("Car3",140)

  #instantiate Track
  track1 = Track.new(100)

  #Instantiate Game
  game1 = Game.new

  #Add Cars to Game
  game1.addCars(car1)
  game1.addCars(car2)
  game1.addCars(car3)

  #Add Tracks to Game
  game1.addTrack(track1)

  p game1

  game1.play(1)

end