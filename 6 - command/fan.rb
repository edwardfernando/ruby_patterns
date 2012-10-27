class Fan

  HIGH = 3
  MED = 2
  LOW = 1
  OFF = 0

  attr_reader :speed

  def high
    @speed = HIGH
  end

  def medium
    @speed = MED
  end

  def low
    @speed = LOW
  end

  def off
    @speed = OFF
  end

end
