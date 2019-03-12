require_relative 'car'
require_relative 'player'
require_relative 'gamePlayModule'

class Game

  attr_reader :cars, :players, :title

  def initialize(title)
    @title = title
    @players = []
    @cars = []
  end

  def carAdd(car)
    @cars.push(car)
  end

  def carRemove(car)
    @cars.pop(car)
  end

  def playerAdd(player)
    @players.push(player)
  end

  def playerRemove(player)
    @player.pop(player)
  end




  def play
    puts "Start Game".center(70, "*")
    GamePlayModule.turn(@cars)

  end

  def stats
    puts "\n\n**********"
    puts "Game Title:"
    puts "\t#{title}"
    puts "Cars:"

    @cars.each do |car|
      puts "\t#{car.stats}"
    end

    puts "Players:"
    @players.each do |player|
      puts "\t#{player.stats}"
    end

  end



end

if __FILE__  == $0

player1 = Player.new("Jimmy")
player2 = Player.new("Rico")
player3 = Player.new("Bobby")


car1 = Car.new("Ford")
car2 = Car.new("Honda")
car3 = Car.new("Toyota")
car4 = Car.new("Renault")

gameNFS = Game.new("NFS")


gameNFS.carAdd(car1)
gameNFS.carAdd(car2)
gameNFS.carAdd(car3)

gameNFS.playerAdd(player1)
gameNFS.playerAdd(player2)
gameNFS.playerAdd(player3)

#gameNFS.stats

gameNFS.play


end