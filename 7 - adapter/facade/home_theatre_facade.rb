require './amplifier.rb'
require './tuner.rb'
require './screen.rb'
require './popper.rb'
require './cd_player.rb'
require './dvd_player.rb'
require './projector.rb'
require './lights.rb'

class HomeTheatreFacade
  attr_reader :amp, :tuner, :screen, :popper, :cd_player, :dvd_player,
    :projector, :lights

  def initialize(amp, tuner, screen, popper, cd_player, dvd_player, projector,
                 lights)
    @amp = amp
    @tuner = tuner
    @screen = screen
    @popper = popper
    @cd_player = cd_player
    @dvd_player = dvd_player
    @projector = projector
    @lights = lights
  end

  def watch_movie(movie)
    @popper.on
    @lights.dim
    @screen.down
    @projector.on
    @projector.widescreen
    @amp.on
    @amp.set_surround_sound
    @amp.volume = 5
    @dvd_player.on
    @dvd_player.play(movie)
  end

  def end_movie
    @popper.off
    @lights.on
    @screen.up
    @projector.off
    @amp.off
    @dvd_player.off
  end
end
