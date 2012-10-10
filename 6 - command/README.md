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
require './stereo

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
