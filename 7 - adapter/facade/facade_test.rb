require 'test/unit'

require './home_theatre_facade.rb'
require './amplifier.rb'
require './tuner.rb'
require './screen.rb'
require './popper.rb'
require './cd_player.rb'
require './dvd_player.rb'
require './projector.rb'
require './lights.rb'

class FacadeTest < Test::Unit::TestCase

  def setup
    @amp = Amplifier.new
    @tuner = Tuner.new
    @screen = Screen.new
    @popper = Popper.new
    @cd_player = CdPlayer.new
    @dvd_player = DvdPlayer.new(@amp)
    @projector = Projector.new(@dvd_player)
    @lights = Lights.new

    @facade = HomeTheatreFacade.new(@amp, @tuner, @screen, @popper, @cd_player,
                                   @dvd_player, @projector, @lights)
  end

  def test_init
    assert_equal @amp, @facade.amp
    assert_equal @tuner, @facade.tuner
    assert_equal @screen, @facade.screen
    assert_equal @popper, @facade.popper
    assert_equal @cd_player, @facade.cd_player
    assert_equal @dvd_player, @facade.dvd_player
    assert_equal @projector, @facade.projector
    assert_equal @lights, @facade.lights
  end

  def test_watch_movie
    @facade.watch_movie("BSG")

    assert_equal :on, @facade.popper.power
    assert_equal :dim, @facade.lights.power
    assert_equal :down, @facade.screen.position
    assert_equal :on, @facade.projector.power
    assert_equal :widescreen, @facade.projector.mode
    assert_equal :on, @facade.amp.power
    assert_equal :surround, @facade.amp.sound
    assert_equal 5, @facade.amp.volume
    assert_equal :on, @facade.dvd_player.power
    assert_equal "BSG", @facade.dvd_player.currently_playing
  end

  def test_end_movie
    @facade.watch_movie("BSG")
    @facade.end_movie
    assert_equal :off, @facade.popper.power
    assert_equal :on, @facade.lights.power
    assert_equal :up, @facade.screen.position
    assert_equal :off, @facade.projector.power
    assert_equal :off, @facade.amp.power
    assert_equal :off, @facade.dvd_player.power
  end

end
