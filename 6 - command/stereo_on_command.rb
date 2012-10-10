require './stereo'

class StereoOnCommand

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.on
  end

end
