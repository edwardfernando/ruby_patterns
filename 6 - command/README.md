# Command Pattern

## Problem

The book presents a situation of programming a remote control device that can
interface with various devices.  The remote control has multiple slots, one for
each device, and two controls per slot: on and off.  It also has a global undo
button.

The vendor of each device has provided a class to interface with the device.
There is not much consistency between vendors.  For example, the Stereo
class looks like this:

```ruby
class Stereo
    def on
    end

    def off
    end

    def set_cd
    end

    def set_dvd
    end

    def set_radio
    end

    def set_volume(level)
    end
end
```

while the Thermostat class looks like this:
```ruby
class Thermostat
   def set_temperature(degree)
   end
end
```

We want to avoid progamming the remote like this:
```ruby
if (slot1 == Stereo)
    stereo.on
elsif (slot1 == Sprinker)
    sprinker.waterOn
elsif ...
```

That code will become unmanageable very quickly.

## Solution

Use the command pattern!  It encapsulates the method invocation so that the
object invoking the computation (the remote control) doesn't need to know how
to do things (doesn't need to know the internals of the device classes,
like which method from the class to call when a button is pressed).

It allows us to separate the object making the request from the objects that
receive and execute the requests.

### Command Interface

Ruby doesn't need this for all concrete commands to implement the interface.
See the next section.

### Concrete Commands

Create a new command class for each of the vendor-provided device classes.

Each class holds the device for which it was created, and has an
initialize method to pass in an instance of the device.  This device object is
referred to as the "Receiver", the object that we are controlling.

To implement the Command interface, each of these new classes must define an
execute method.  The execute method calls the method of the receiver that we
wish to invoke.

For example, we would define separate concrete commands for the on and off
methods of the Stereo.

We can also get a little more complicated.  The book uses other methods from
the Stereo class to implement a command to turn the stereo set to play the CD
at a certain volume level.

```ruby
require './stereo'

class StereoOnWithCdCommand

    def initialize(stereo)
        @stereo = stereo
    end

    def execute
        @stereo.on
        @stereo.set_cd
        @stereo.set_volume(11)
    end

end
```

### Receiver

The classes were provided by the vendors.  Each instance of any of the classes is
potentially a receiver.

This example doesn't address the specifics of how the
different instances are created.  It's not important to the pattern.

### Invoker

The Invoker is what sets and invokes the commends.  In the books example, this
is the Remote Control device, for which we need to write an API.

We know the remote control has 7 slots with 2 buttons each, for a total of 14
possible commands (7 on, 7 off).  So put 2 arrays of 7 elements each.  The
on/off commands come paired, so the method definition to set a command looks
like:
```ruby
def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
end
```

The invoker is supposed to invoke the command.  Since we have two buttons for
each slot, we need to distinguish between invoking the on commands and invoking
the off commands.

```ruby
def on_button(slot)
    @on_commands[slot].execute
end

def off_button(slot)
    @off_commands[slot].execute
end
```

### Client

The client is responsible for creating the concrete commands and assigning them
a receiver.  In the context of the remote control device, we make a a
RemoteLoader class to perform these tasks.

### Other goodies

We were also supposed to add support for the global Undo button.  So each
command class needs an undo method designed to reverse the execute method.

Then, the remote control needs to track internally the most recent command
called.  This attribute should be updated with each button pushed.  Last, add
another method to link the undo button event with the undo method of the last
run command.

## A more complicated command

Implemented he command pattern with an undo functionality is easy for devices
with only two states, on and off.  The book goes through the scenario with a
multistate ceiling fan.  It has 4 states: off, low, medium, and high.  Methods
might look like

```ruby
class Fan

   HIGH = 3
   MED = 2
   LOW = 1
   OFF = 0

   attr_reader :speed

   def high
      @speed = HIGH
   end

   def medium
      @speed = MED
   end

   def low
      @speed = LOW
   end

   def off
      @speed = OFF
   end

end
```

The book example defines a new command class for each of the different states.
To deal with the undo, read the fan's current speed in each execute method and
store it in a local var, @old_speed.  Then, all the undo method needs to do is
switch on the value of @old_speed and set the fans speed accordingly.

The book sample doesn't do anything fancier with the remote control for fans.
There are no "increase speed" or "decrease speed" commands.  Each slot in the
remote gets assigned pair of buttons, one of which is always the off button for
the fan.

## Macro Commands

Lets make a command that can perform multiple actions with the push of only a
single button.

Define a new class, MacroCommand, that takes an array of individual commands in
its initialize method.
It must still have an execute and undo method to conform to the Command
interface.  They iterate over all the single commands and execute or undo each
one.

To make this play nice with the on/off button setup, instantiate two
MacroCommands in the remote loader.  One will be in charge of turning stuff on,
the other will turn the same stuff off.
