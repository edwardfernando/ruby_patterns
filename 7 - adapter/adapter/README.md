# Adapter Pattern

## Problem

The problem this pattern solves is pretty simple: suppose you have an existing
system which implements one interface, but the client of your existing system
expects an interface that is incompatible with that of the existing system.  How
can you make your system compatible without changing its code?

The book example has a client that expects a Duck interface, and the existing
system uses a Turkey interface.  Duck can quack and fly, Turkey can
gobble and fly. 


## Solution

Use an Adapter!

The adapter needs to take a thing that implements an existing interface (the
adaptee) and make it work with the client's expected interface (the target
interface).

To do this, the adapter wraps the adaptee and implements the target interface
by converting and forwarding target interface requests to the adaptee.


### Adaptee

For the book example, the adaptee is an object that implements the Turkey
interface.  There is no real concept of an interface in Ruby, but any object
that wants to look like a Turkey need only have the methods gobble and fly.


### Target Interface

The client expects to work with a Duck, so the target interface is the one that
the Duck implements.  For an object to look like a Duck, it only needs the
methods quack and fly.


### Client

The client is any code that expects to work with a Duck.  For my code, the
client is merged with the unit tests.


### Adapter

The adapter takes the adaptee as an argument in the initializer.  It implements
the methods quack and fly to conform to the Duck interface, and delegates those
requests to the appropriate methods on the adaptee, gobble and fly.
