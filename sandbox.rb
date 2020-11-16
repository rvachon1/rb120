class Animal

  def initialize
  end

  def speak
    "Arf!"
  end
end

module Swimable
  def swim
    "Hey Look! I'm swimming!"
  end
end

class GoodDog < Animal
  include Swimable

  DOG_YEARS = 7
  @@number_of_dogs = 0

  attr_accessor :name, :height, :weight, :age

  def initialize(n, h, w, a)
    @@number_of_dogs += 1
    super()
    @height = h
    @weight = w
    @age = a * DOG_YEARS
  end

  def GoodDog.number_of_dogs()
    @@number_of_dogs
  end

  def speak
    "#{name} says, Arf!" + super
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def some_method
    self.info
  end

  # def to_s
  #   "This dogs name is #{self.name} and age is #{self.age}."
  # end

  def what_is_self
    self
  end

  private

  def human_years
    DOG_YEARS * age
  end

end

gus = GoodDog.new('Gus', "12 inches", "192 lbs", 6)
stella = GoodDog.new("mew", "43 cms", "2030 lbs", 3)

p gus.info
gus.change_info("Jenna", "170 cm", "148 lbs")
p gus.info

p gus.some_method

p GoodDog.number_of_dogs

p gus.age
p stella.age

puts gus
p gus

gus.height = 555

p gus.what_is_self
puts gus.what_is_self

puts gus.speak

p gus.class

p gus.swim

puts GoodDog.ancestors

p gus.human_years