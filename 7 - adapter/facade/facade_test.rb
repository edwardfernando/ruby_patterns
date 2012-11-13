require 'test/unit'

require './amplifier.rb'
require './tuner.rb'

class FacadeTest < Test::Unit::TestCase

  def test_amo_init
    amp = Amplifier.new
    assert_equal amp.power, :off
    assert_equal amp.sound, :stereo
  end

  def test_amp_on
    amp = Amplifier.new
    amp.on

    assert_equal amp.power, :on
  end

  def test_amp_off
    amp = Amplifier.new
    amp.on
    amp.off

    assert_equal amp.power, :off
  end

  def test_amp_stereo
    amp = Amplifier.new
    amp.set_stereo_sound

    assert_equal amp.sound, :stereo
  end

  def test_amp_stereo
    amp = Amplifier.new
    amp.set_surround_sound

    assert_equal amp.sound, :surround
  end

end

