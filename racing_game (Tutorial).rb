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

#What we just did is an important concept when it comes to dealing with classes.  Classes encapsulate variables so you
#can't directly access them from the main program.  To access them you will need to write methods.  You can think of
#methods as ambassadors.  Classes are like a locked castle.  Methods are ambassadors setup to communicate with the
#outside world.
#
#What we wrote above is known as a getter method.  It's job is to 'get' some value.  In our example, we got
#the name of the car: firstCar.nameGet.

#let's create a few more cars:

secondCar = Car.new("Toyota")
thirdCar = Car.new("Honda")

puts secondCar.nameGet
puts thirdCar.nameGet

#All three cars gave you their individual names because they are all INDIVIDUAL objects that you created from the
#Car class.

#What if we wanted to change the name of one of those cars?  How would we do that?
#Here's where I used to mess it up.  I'd try to do something like:
#
firstCar = Car.new("Ford")
#puts firstCar.nameGet = "BMW"

#That gives an error "undefined method `nameGet=' for #<Car"
#It's because the job of the getter method is just to return @name.  It doesn't have any way to take parameters.
#You're passing the parameter "BMW" but it can't take it.
#Ruby is smart though, in the error message, it gives you a hint saying "nameGET=" doesn't exist.
#It's looking for a setter method that ends with "=" that doesn't exist yet.  Let's create it.  You can
#name is ANYTHING you want, but for this example, I'll name it "nameSet=""


#Remember that instance variables are all encapsulated within the Car class (a castle).  And we need an ambassador
#(method) to pass a new name value to the object.  This method is called a SETTER method.

class Car

  def initialize(whatevernameyouwant)
    @name = whatevernameyouwant
  end


  def nameGet
    @name
  end

  #Creating a setter method

  def nameSet=(changedName)
    @name = changedName
  end

end

#We give the nameSET= method a parameter called changedname.  Why?
#When we try to change the name by running

firstCar = Car.new("Ford")
puts firstCar.nameSet=("BMW")

#that BMW string will be passed to "changedName".  Inside the method, the @name instance variable will
#reference our new passed string!  Let's try it:

puts firstCar.nameSet=("BMW")
puts firstCar.nameGet

#In Ruby, both of these below do the same thing.  The first line is clearer because you're passing
# "BMW" parameter to the method called nameSET=.  The second line is prettier and easier to read.
#
puts firstCar.nameSet=("BMW")
#is the same as:
puts firstCar.nameSet = "BMW"

#Let's practice.  What if you wanted to give this car a color property?  You're going to need a color
#instance variable, right?  Everytime I create a car, I want to give it a name and a color.
#I need 2 parameters in my initialize method within the car class.

class Car

  def initialize(whatevernameyouwant, color)
    @name = whatevernameyouwant
    @color = color
  end

  #hidden getter and setter code for name.
end

#We can now create a car object by passing in the name and the color.  In the initialize method, @color will get
#assigned the color argument that is passed through to the initialize method.

firstCar = Car.new("Ford", "Black")
puts firstCar.inspect

#We can see in the output that the object Car has @name = "Ford" and @color = "black"
#Let's go ahead and write getter and setter methods to retrieve the color from this car object and also
#to set / modify the color of a car object.

class Car

  def initialize(whatevernameyouwant, color)
    @name = whatevernameyouwant
    @color = color
  end

  #Creating a color setter method
  def colorGet
    @color
  end

  #Creating a color setter method
  def colorSet=(anycolor)
    @color = anycolor
  end

  ##Creating a name getter method
  def nameGet
    @name
  end

  #Creating a name setter method
  def nameSet=(changedName)
    @name = changedName
  end

end



#I'm able to get the firstCar color.
#Let't change it and get the new color.

#firstCar.colorSet = "Blue"
puts firstCar.colorGet

#Let's go ahead and show the entire code and create several car objects and change their properties:

firstCar = Car.new("Ford", "Black")
secondCar = Car.new("Honda", "Red")
thirdCar = Car.new("Toyota", "Blue")

puts firstCar.colorGet
puts secondCar.colorGet
puts thirdCar.colorGet

firstCar.colorSet = "Orange"
secondCar.colorSet = "Magento"
thirdCar.colorSet = "Yellow"

puts firstCar.colorGet
puts secondCar.colorGet
puts thirdCar.colorGet

#All three car objects: firstCar, secondCar, and thirdCar were created from the Car class (factory).
#All three car objects have the name and color property...but all have unique names and colors!  Each one is unique.

##Instance variables that AREN'T used when an object is created.  How do we do that?
#Henry Ford famously said you can have his cars in any color as long as it's black.  Black paint was the only
#paint his Ford Model T came out of the factory with.

#Let's say our car Class (factory) rolls out cars that are only initially black.  It would be too much repitition
#to always assign them a color 'black' each time a car object is created.

#This is too much repitition.  Color black is assigned everytime...
firstCar = Car.new("Ford", "Black")
secondCar = Car.new("Honda", "Black")
thirdCar = Car.new("Toyota", "Black")


# What can we do?  Let's take the color method out of our initialize method!
# Let's still keep the @color instance variable, but we'll set it to a string value of "black".

class Car

  def initialize(whatevernameyouwant)
    @name = whatevernameyouwant
    @color = "black"
  end

end

firstCar = Car.new("Ford")
secondCar = Car.new("Honda")

puts firstCar.colorGet
puts secondCar.colorGet

#You created two car objects. You didn't have to pass the color
#argument when creating the class. They were both black.

#Let's do the same thing for speed.  When we create these cars, their speed is going to be zero by default.

#Since we're pushing cars out of the Car Class (Factory), we might not always want to name our cars. If we don't name
#them, we want a default @name value to be used automatically.  We can do that by giving a default value to
#@name parameter in the initialize method.

class Car

  def initialize(whatevernameyouwant="default_car_name")
    @name = whatevernameyouwant
    @color = "black"
    @speed = 0
  end
end

#Now you can create a new car and if you don't pass a car name as an argument, it will take the default
firstCar = Car.new()
puts firstCar.nameGet

#You're flexible though, you can also pass a name argument and it will take your name and overwrite the default one:
firstCar = Car.new("Ford")
puts firstCar.nameGet

#To solidify these concepts, go ahead and code YOUR OWN example.  Make a Computer Class (factory that generates
# computers. Give these computers names, color, prices.  Write getters and setters to get the price and to set new
# prices.)

######Write about how attr_reader and attr_writer creates these methods for you.
###write about how to use self. or should you reference @name.















#A setter method is also special because the method itself is "nameSET="
#It's an empty setter method right now.  In which instance variable is the car name stored?  It's stored in @name.
#

#Make site today. Setup syntax highlighting. (Comment for Nikita.)


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