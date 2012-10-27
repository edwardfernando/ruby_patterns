require './stereo'

class StereoOffCommand

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.off
  end

  def undo
    @stereo.on
  end

  def to_s
    "Stereo Off Command for stereo #{@stereo.object_id}"
  end
end
