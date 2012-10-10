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

end
