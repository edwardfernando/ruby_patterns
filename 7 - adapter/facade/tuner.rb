class Tuner

  attr_accessor :frequency
  attr_reader :power, :band

  def on
    @power = :on
  end

  def off
    @power = :off
  end

  def set_am
    @band = :am
  end

  def set_fm
    @band = :fm
  end

end
