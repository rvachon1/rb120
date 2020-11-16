class Cat
  CAT_COLOR = "red"

  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hey there! My name is #{name}! I'm #{CAT_COLOR}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet