#March 4, 2019
#By Nikita Kazakov

#1---In this tutorial, I'm going to describe setters / getters.
#2---I'm also going to describe attr_reader and attr_writer
#3---*WITHIN* the class, should you use attr_reader/writer methods or instance variables instead?
#Let's get to learning!


#Let's create a SIMPLE car class.  A class is like a car factory.
#It's a template for making car objects that you'll use.

    class Car
    end

#Let's create a car object from the car Class

    firstCar = Car.new

#We created a new Car object and assigned it to firstCar variable.  firstCar is simply POINTS to the car object.
#Let's prove that by doing this:
    firstCar = Car.new
    firstCarPointer = firstCar

#firstCarPointer now points to firstCar.  What does firstCar point to?  The actual car object!
#Run puts and you'll see they map to the SAME car object in memory.
    puts firstCar
    puts firstCarPointer

#the result is:
# #<Car:0x000055fe320d73f8>
# #<Car:0x000055fe320d73f8>

#So we made out first car object. You can make as many as you want.  I'll add a second one:

    firstCar = Car.new
    secondCar = Car.new

#We now have two cars but they don't do anything!  It's because our class is totally empty.  BORING.
#Let's begin designing our car factory (car Class).

#When a class is created in Ruby, the very first thing is does is runs a method called INITIALIZE.
#This method stores variables you'll use in the class while designing your car. Every single class
#in Ruby runs initialize FIRST.
#So Let's write it:

    class Car

      def initialize

      end

    end

#Let's run firstCar object again:
    firstCar = Car.new

#Nothing happens.  Everything inside the initialize method is run but since it's empty, we get nothing as we'd expect.
#Let's add something to it.

    class Car

      def initialize
        puts "See, I told you initialize method runs first!"
      end

    end
    firstCar = Car.new
    firstCar

#Finally, you see a message that we added!  It's because we ran the firstCar object, which went into the car class,
# and ran the initialize method which had a puts "See..." message!  Very cool.

#Still the car can't do much as of right now.  I want this car to have a name.  Every time I create a new car object,
#I want a name to be given (passing a parameter name).  We do this in the initialize method:

    class Car

      def initialize(name)
        puts "See, I told you initialize method runs first!"
      end

    end
puts"\n\n\n"
#So now you run:
     #firstCar = Car.new
     firstCar
#and you get an error "initialize': wrong number of arguments (given 0, expected 1)"
#It's simply because you told the car Class that it should expect a name parameter but you didn't provide one.
#Let's fix the issue by passing in a name parameter when creating a new car object:

    firstCar = Car.new("Ford")
    puts firstCar.inspect

#We run firstCar.inspect and although we gave this firstCar object a name "Ford", it didn't take it.
#This is where the idea of instance variables comes in.
#When you pass a parameter "name", you need to assign it to a special instance variable that lives within a class.
#It's denoted by "@" in front of the name.  Let's do that:

class Car

  def initialize(name)
    @name = name
    puts "See, I told you initialize method runs first!"
  end

end

firstCar = Car.new("Ford")
puts firstCar.inspect

#Now we get "#<Car:0x0000557bea59fe78 @name="Ford">" from the firstCar.inspect.  It saved the name of our car to a
# special instance variable "Ford".
#Note, the parameter name and the instance variable name do not have to be the same at all.  I could have said:


class Car
  def initialize(whatevernameyouwant)
    @name = whatevernameyouwant
    puts "See, I told you initialize method runs first!"
  end
end

#Let's 2 more car objects:
    firstCar = Car.new("Ford")
    secondCar = Car.new("Toyota")
    thirdCar = Car.new("Honda")
    puts firstCar.inspect
    puts secondCar.inspect
    puts thirdCar.inspect

#<Car:0x00005624ce88fc68 @name="Ford">
#<Car:0x00005624ce88fab0 @name="Toyota">
#<Car:0x00005624ce88f8d0 @name="Honda">

#Each car object saved the name you passed to them!  Very cool.

#Our car is still very simple.  Doesn't do much but hold a name.
#Since the name is stored in an instance variable called @name, let it be printed when we run a car object:

    class Car
      def initialize(whatevernameyouwant)
        @name = whatevernameyouwant
        puts "See, I told you initialize method runs first!"
        puts "The name of my car is " + @name
      end
    end

    firstCar = Car.new("Ford")
    firstCar

#Just like you used this instance variable @name in this string print out, you can use it anywhere
#WITHIN the class.  Only the class.  You can't call on it outside the class because it's not a method.
#It's simply an instance variable that lives ANYWHERE IN THE CLASS ONLY.

#When you create the car object, you can run methods on it.
#What if I want to know the name of this object...outside the class?
#I want to run something like:


firstCar = Car.new("Ford")
#firstCar.name

puts "\n\n\n\n*****************"
#You get an error! undefined method `name'.
#So let's fix that, if we want the name, let's create a name method that will show the name instance variable!

    class Car
      def initialize(whatevernameyouwant)
        @name = whatevernameyouwant
      end


      def name
      end


    end

#We created the name method.  Let's try to run firstCar.name
    firstCar = Car.new("Ford")
    firstCar.name

#Nothing shows up.  Why?  That's because although we created a method called "nameGet" we didn't give it any
#any instructions to do anything.  It's empty.
#When we call the name method, we want it to return the name string "Ford" which is kept in the @name instance variable
#within the class.


    class Car

        def initialize(whatevernameyouwant)
          @name = whatevernameyouwant
        end


        def nameGet
          @name
        end

    end

    firstCar = Car.new("Ford")
    puts firstCar.nameGet

#YEAHHHHH BUDDY!!  The name FORD appears!  We called the "name" method and it returned @name instance variable back.
#Remember, we couldn't access this instance variable outside of Class...but now we could by passing it THROUGH a
#method.
#
#
#
#See misusing ruby attribute readers and writers:
# https://railsadventures.wordpress.com/2014/12/10/misusing-rubys-attribute-readers-and-writers/
#ALSO

=begin
    class Car
      def initialize
      end
    end



#Let's add an "initialize" method and give a name parameter.  This means each time we create
# a new Car item by using: Car.new, you'll need to give a name: Car.new("Ford") for example.
#
#So now, let's create



class Car
  def initialize
  end
end


class Car

  def initialize(name)
  end

end



class Car

  def initialize(name)
    @name = name.capitalize
    @health = 100
  end

  #Create getters (could use attr_reader)
  #These are equivalent to attr_reader :name, :ignition
  def name
    @name
  end

  def health
    @health
  end

  #Create setters (could use attr_writer)
  #These are equivalent to attr_writer :name, :ignition
  def name=(name)
    @name = name
  end

  def ignition=(value)
    @ignition = value
  end

end

car1 = Car.new("Ford")
puts car1.stats
puts car1.ignitionGet
car1.ignitionOn
car1.ignitionOn
car1.ignitionOff
car1.ignitionOff
car1.ignitionOn













class Car

  def initialize(name)
    @name = name.capitalize
    @health = 100
  end

  #Create getters (could use attr_reader)
  #These are equivalent to attr_reader :name, :ignition
  def name
    @name
  end

  def health
    @health
  end

  #Create setters (could use attr_writer)
  #These are equivalent to attr_writer :name, :ignition
  def name=(name)
    @name = name
  end

  def ignition=(value)
    @ignition = value
  end


  #Methods below

  def ignitionOn

    if self.ignitionGet == false then
      self.ignitionSet = true
      puts "Vroom Vroom...Car has turned on! Ignition = #{ignitionGet}"
    else
      puts "The car was already on. Ignition = #{ignitionGet}"
    end

  end

  def ignitionOff

    if self.ignitionGet == true then
      self.ignitionSet = false
      puts "Car just turned off. Ignition= #{ignitionGet}"
    else
      puts "The car was already turned off... Ignition = #{ignitionGet}"
    end

  end

  def stats
    puts "Car name: #{nameGet}.    Color: #{colorGet}.    Health: #{healthGet}"
  end

end


=end