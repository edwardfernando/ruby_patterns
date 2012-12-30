# Facade Pattern

## Problem

Suppose we have a complex set of subsubsystems, where each component of the
subsystem has its own interface.  Together, the set of all the exposed interface
methods might be quite complex.  A simpler, unified interface to the set of
subsytem interfaces would be nice.

The book example is that of a home theatre system.  It's composed of many
pieces:

* Amplfier
* Tuner
* CD Player
* DVD Player
* Projector
* Screen
* Projector
* Lights
* Popcorn machine

To watch a movie, the following steps need to be performed:
1. Turn on the popcorn machine
2. Start the popcorn machine
3. Dim the lights
4. Put the screen down
5. Turn on the projector
6. Set the projector input to DVD
7. Put the projector in widescreen mode
8. Turn on the amplifier
9. Set the amplifier to DVD input
10. Set the amplifier to surround sound
11. Set the amplifier volume to medium
12. Turn on the DVD player
13. Start the DVD player playing

Similar tasks will be similar.  Can we wrap all these individual calls into
one easy-to-use interface?

## Solution

Use the Facade Pattern!


### Subsystem classes

These are classes representing each piece of the complete theatre system.


### Facade

The facade exposes a few high level methods to the user, such as watch\_movie,
end\_movie, play\_cd, stop\_cd, etc.  This way, a client only has to use the
facade to perform complex and multiple operations on the components, instead
of having to call each component directly.

It wraps instances of the subsystem components, passing them in through the
initialize method.  This is similar to how the adapter pattern wraps the
adaptee.
