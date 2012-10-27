require './remote_control'
require './stereo_on_command'
require './stereo_off_command'
require './fan_medium_command'
require './fan_off_command'
require './macro_command'

# remote control
remote = RemoteControl.new

# load devices
my_stereo = Stereo.new
your_stereo = Stereo.new
my_fan = Fan.new

# create commands
my_stereo_on = StereoOnCommand.new(my_stereo)
my_stereo_off = StereoOffCommand.new(my_stereo)
your_stereo_on = StereoOnCommand.new(my_stereo)
your_stereo_off = StereoOffCommand.new(my_stereo)
fan_medium = FanMediumCommand.new(my_fan)
fan_off = FanOffCommand.new(my_fan)

# load commands
remote.set_command(0, my_stereo_on, my_stereo_off)
remote.set_command(1, your_stereo_on, your_stereo_off)
remote.set_command(2, fan_medium, fan_off)


puts remote

remote.on_button(0);
puts remote
remote.on_button(1);
puts remote
remote.on_button(2);
puts remote

remote.off_button(1);
puts remote
remote.off_button(0);
puts remote
remote.off_button(2);
puts remote

# try some macro commands
# new remote
remote = RemoteControl.new

# Command to set fan at medium and turn on stereo
macro_on = MacroCommand.new([fan_medium, my_stereo_on])

# Command to turn off fan and stereo
macro_off = MacroCommand.new([fan_off, my_stereo_off])

remote.set_command(0, macro_on, macro_off)

puts remote
remote.on_button(0)
puts remote
remote.off_button(0)
puts remote
