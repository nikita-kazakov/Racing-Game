require_relative 'car'

describe Car do

  before do
    @car = Car.new("Ford")
  end


  it "has default name of NoName" do
    car = Car.new()
    car.name.should == "Noname"
  end

  it "velocityIncrease increases by 5" do
    @car.velocityIncrease
    @car.speed.should == 5
  end

  it "velocityDecrease decreases by 5" do
    @car.velocityDecrease
    @car.speed.should == -5
  end

  it "car turns off on ignitionOff" do
    @car.ignition = true
    @car.ignitionOff
    @car.ignition == false
  end

  it "car turns on ignitionOn" do
    @car.ignition = false
    @car.ignitionOn
    @car.ignition == true
  end


end