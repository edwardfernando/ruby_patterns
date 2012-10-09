require './stereo'

class StereoCommand

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.on
  end

end
