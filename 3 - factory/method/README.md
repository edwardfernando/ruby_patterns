# Factory Method Pattern

## Motivation

The simple factory "pattern" has some problems: each time we add a new concrete
product, the factory class needs to be updated.  In other words, the factory
entity's behaviour cannot be extended without modifying its source code.  This
violates the open/closed principle.

The factory method pattern partially solves this by allowing the factory to be
"extended" via a factory method.  There is no factory class.  The creator (or
client) provides a factory method which subclasses of the client override.  In
this way, the factory method lets the subclasses decide which class to
instantiate.

## Problem

Back to our pizza example, suppose we have multiple stores that each want to
create their own brands of veggie and cheese pizzas.  The pizza name, dough,
and sauce, and toppings will likely vary between stores.

## Solution

Use the factory method pattern!  If we stuck with the simple factory, we would
need to add more conditionals to the create\_pizza method in the factory.

### Product Interface

Define Pizza base class.  Ruby doesn't have abstract classes, so I'll need to
read up a bit more to see if this base class is really needed.  The base class
is nice because it provides common behaviour for all Concrete Products (prepare,
bake, cut, box).

The Pizza base class has a name, dough, sauce, and an Array of toppings.

### Concrete Products

Define the different types of cheese and veggie pizzas here, each extending the
Pizza, overriding the base class attributes and methods when needed.

### Creator (or Client)

For us, this is the PizzaStore base class.  All it defines is the
order\_pizza method, which takes a string, as did the order\_pizza method in
the simple factory version of the PizzaStore.  We can't declare an abstract
factory method create\_pizza here, as we would in Java, because Ruby doesn't
have abstract methods.

### Concrete Creators

These are all the different pizza stores, all extending PizzaStore.  Each must
define the method create\_pizza, which takes a string and contains the logic for
deciding which type of pizza to return.
