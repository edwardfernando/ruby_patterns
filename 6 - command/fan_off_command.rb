require './fan'

class FanOffCommand

  def initialize(fan)
    @fan = fan
  end

  def execute
    @old_speed = @fan.speed
    @fan.off
  end

  def undo
    case @old_speed
    when Fan.HIGH
      @fan.high
    when Fan.MED
      @fan.medium
    when Fan.LOW
      @fan.low
    when Fan.OFF
      @fan.off
    else
    end
  end

  def to_s
    "Fan off command for fan #{@fan.object_id}"
  end
end
