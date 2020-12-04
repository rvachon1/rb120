class Person
  # include Comparable

  attr_accessor :last_name
  attr_reader :name, :first_name

  def initialize(name)
    @first_name, @last_name = name.split
    self.last_name_checker
  end

  def name
    @first_name + " " + @last_name
  end

  def name=(name)
    @first_name, @last_name = name.split
    self.last_name_checker
  end
  
  def last_name_checker
    @last_name == nil ? @last_name = "" : @last_name
  end

  # def <=>(other)
  #   name <=> other.name
  # end
end

p bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name