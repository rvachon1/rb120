class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def print_pet
    puts "a #{type} name #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.count 
  end

  def add_pet(pet)
    @pets << pet
  end
end

class Shelter
  def initialize
    @adopt_list = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @adopt_list[owner.name] = owner
  end

  def print_adoptions
    @adopt_list.each do |name, owner|
      if name == :unadopted
        puts "The list of unadopted pets is as follows:"
      else
        puts "#{owner.name} has adopted the following pets:"
      end
      owner.pets.each do |pet|
        pet.print_pet
      end
      puts "\n"
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
gus          = Pet.new('dog', 'gus')
lucky        = Pet.new('dog', 'lucky')
bugzie       = Pet.new('dog', 'bugzie')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
unadopted = Owner.new(:unadopted)

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(unadopted, gus)
shelter.adopt(unadopted, lucky)
shelter.adopt(unadopted, bugzie)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.