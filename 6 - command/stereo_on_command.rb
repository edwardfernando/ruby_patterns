require './stereo'

class StereoOnCommand

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.on
  end
  
  def undo
    @stereo.off
  end

  def to_s
    "Stereo On Command for stereo #{@stereo.object_id}"
  end

end
