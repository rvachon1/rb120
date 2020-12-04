class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def get_switch
    switch
  end

  private

  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

test = Machine.new
test.start
test.stop
p test.get_switch
