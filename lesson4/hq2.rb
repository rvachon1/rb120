module Wheelable
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_efficiency * @fuel_capacity
  end
end

class Auto < Vehicle
  include Wheelable

  def initialize
    # 4 tires are various tire pressures
    @tire = [30,30,32,32] 
    super(50, 25.0)
  end
end

class Motorcycle < Vehicle
  include Wheelable

  def initialize
    # 2 tires are various tire pressures
    @tires = [20,20] 
    super(80, 8.0)
  end
end

class SeaCraft < Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = km_traveled_per_liter
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end

  def range
    super + 10
  end
end

class Catamaran < SeaCraft
end

class MotorBoat < SeaCraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end