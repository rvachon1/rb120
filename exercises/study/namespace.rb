module Animal
  class Dog
    def bark
      p "arf"
    end
  end

  class Cat
    def meow
      p "meow"
    end
  end
end

gus = Animal::Dog.new
felix = Animal::Cat.new

felix.meow
gus.bark