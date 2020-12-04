class Tetris
  attr_accessor :grade


  def initialize(grade=nil)
  end

  def speak
    "#{self.class} says"
  end
end

puts Tetris.new.speak