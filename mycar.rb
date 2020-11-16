module Box
  def box_size(doors)
    case doors
    when 2 then "10ft"
    when 4 then "20ft"
    end
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@vehicle_count = 0

  def initialize(year, color, model)
    @@vehicle_count += 1
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def age
    "Your vehicle is #{vehicle_age} years old."
  end

  def self.print_count
    puts @@vehicle_count
  end

  def speed_up(speed)
    @speed += speed
  end

  def brake(speed)
    @speed -= speed
  end

  def shut_off()
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
    "Your new car color is #{self.color}!"
  end

  def self.milage(kms, litres)
    "Gas Milage: #{(litres/kms.to_f*100).round(2)} L/100kms"
  end

  private

  def vehicle_age
    Time.now.year - @year
  end
end

class MyTruck < Vehicle
  TYPE = "Truck"

  include Box

end

class MyCar < Vehicle
  TYPE = "Car"


  def self.what_am_i
    "I'm a MyCar class!"
  end



  # def to_s
  #   "Year: #{self.year} Model: #{self.model} Color: #{self.color}"
  # end
end

# suzzy = MyCar.new(2007, :gold, :grande_vitarra)

# p suzzy.speed_up(100)

# p suzzy.brake(25)

# p suzzy.shut_off

# p suzzy.spray_paint(:red)

# p MyCar.what_am_i

# p MyCar.milage(425, 55)

# puts suzzy

Vehicle.print_count
suzzy = MyCar.new(2020, :black, :civic)
duck = MyTruck.new(2019, :grey, :durango)
Vehicle.print_count
p duck

# p duck.box_size(4)
# # p suzzy.box_size(2)

# puts "*****VEHICLE*****"
# puts Vehicle.ancestors
# puts "*****MyCar*****"
# puts MyCar.ancestors
# puts "*****MyTruck*****"
# puts MyTruck.ancestors
# puts "*****Box*****"
# puts Box.ancestors

p suzzy.age
p duck.age