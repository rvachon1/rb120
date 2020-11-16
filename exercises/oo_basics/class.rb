module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Elizabeth")
kitty.name = "Liza"

kitty.greeting
kitty.walk