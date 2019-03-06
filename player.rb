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