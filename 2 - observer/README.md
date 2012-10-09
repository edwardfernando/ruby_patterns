# Observer Pattern

## Problem

There is an internet based weather monitoring station based on an existing
WeatherData object, which tracks current weather conditions (temperature,
humidity, and pressure).  Create an app that initially provides three display
elements: current conditions, weather statistics, and forecast, all updated in
real time as the WeatherData object acquires the most recent elements.

The WeatherData object has the following API 
* Instance variables: 
	* temperature
	* humidity
	* pressure
* Methods:
	* measurements\_changed

Readers for the instance variables are already defined.

The measurements\_changed method is not implemented, but it gets called whenever
the weather measurements have been updated.

Other develpers must be able to use this API with their own weather displays.

## Solution

### The Observable

First, have the WeatherData class mixin the Observable module.  This is equivalent to
the book description of the WeatherClass implementing the Subject interface.  This
provides the WeatherData class with the changed and notify\_observers methods, which
set the changed state of the object and notify the observers of a change in state if
the observable changed state is true.

Note that the observers are now required to implement an update method.

Next, implement WeatherData::measurements\_changed so that it calls changed and
notify\_obervers, passing the weather data as args, which will be passed along
to the observers.

There is no info provided on how the attributes of the WeatherData object are set.
Implement WeatherData::set\_measurements(temp, hum, press) to set all attributes
at once and call measurements\_changed to signal the update.

### The Observer Mixin

We need a common interface for custom weather displays to use for plugging into
the WeatherData.  In other words, we need common methods for observers to
subscribe and unsubscribe from the obervable.

Handling weather data updates is the responsibilty of each weather display, so
an interface level update method is not appropriate.

Each weather display might also have a specific setup routine, so an interface
level initializer is not appropriate either.

Finally, it's expected that each weather display needs a method to display the
weather data.  It would be nice to require the existence of a display method in
all weather displays, but I don't know how to do this in Ruby!

With this in mind, create an Observer module with only two methods, subscribe
and unsubscribe, each taking an observable as the only argument, which call
observable.add\_observer(self) and observable.delete\_observer(self), respectively.
The methods add\_observer and delete\_observer are expected to be available to
the observable via the Observable mixin.  Each weather display mixes in this
Observer module.

### The Observers

All that remains is to create the weather displays themselves.  They will mixin
the Observer module, implement an update method to handle weather data updates,
 and implement a display method.  For example:
```ruby
require './observer'

class CurrentDisplay
  include Observer

  attr_accessor :temp, :humd, :press

  def update(temp,. humb, press)
    @temp = temp
    @humd = humd
    @press = press
  end

  def display
    'Current temperature: ' + @temp.to_s + ' C degress.'
  end
end
```
