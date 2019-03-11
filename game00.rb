require_relative 'car'
require_relative 'player'
require_relative 'die'

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

    loop do
      puts "\n\n\n"
      puts "Welcome to #{title} Game.".center(100, "*")
      puts "Select an option:"
      puts "1 - Create Player"
      puts "2 - Add Car"
      puts "0 - Exit"

      option = gets.chomp.to_i
      case option

      when 1
        puts "You chose 1"
        puts "Player's Name?"
        name = gets.chomp
        playerAdd(Player.new(name))
        self.stats

      when 2
        puts "Add Car to which player?"

        "Select Player"
        counter = 1
        @players.each do |player|
          puts "#{counter} - #{player.name}"
          counter += 1
        end


      when 0
        puts "Exit!"
        break
      end

    end



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

  gameNFS.stats

  gameNFS.play

end