require_relative 'game'

describe Game do

  before do
    @player = Player.new("Jack")
    @car = Car.new("Ford")
    @game = Game.new("NFS")
  end

  it 'has the right player name ' do
    @player.name.should == "Jack"
  end

end