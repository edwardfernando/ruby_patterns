require './remote_control'
require './stereo_on_command'
require './stereo_off_command'

# remote control
remote = RemoteControl.new

# load devices
my_stereo = Stereo.new
your_stereo = Stereo.new

# load commands
remote.set_command(0, StereoOnCommand.new(my_stereo), StereoOffCommand.new(my_stereo))
remote.set_command(1, StereoOnCommand.new(your_stereo), StereoOffCommand.new(your_stereo))

puts remote

remote.on_button(0);
puts remote
remote.on_button(1);
puts remote

remote.off_button(1);
puts remote
remote.off_button(0);
puts remote
