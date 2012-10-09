# Decorator Pattern

## Problem

A coffee shop has the following beverages:
* House Blend	- $0.89
* Dark Roast	- $0.99
* Decaf		- $1.05
* Espresso	- $1.99

and the following condiments:
* Steamed Milk	- $0.10
* Soy Milk	- $0.15
* Mocha		- $0.20
* Whip cream	- $0.10

Design classes for the above so that any beverage can be combined with any
combination of condiments at runtime, allowing for easy cost calculation of the
final product.

## Solution

Use the decorator pattern!
![Decorator Pattern UML](https://en.wikipedia.org/wiki/File:Decorator_UML_class_diagram.svg)

### Component

Ruby does not have and/or need abstract classes.  Ruby's duck typing makes the
need for a common base class for the beverages and the condiments unneccessary.
But we have to manually ensure that all concrete componenets and concrete
decorators implement any methods that we want to be common between the two.
For us, this means that the cost method must be implemented in each concrete
component and concrete decorator.

Ruby's duck typing adds flexibility.  Any other object that implements the
cost method can be decorated with any of our concrete decorators.

### Concrete Components

These are the objects to be decorated.  In our case, the undecorated versions
of the different beverages.  All they contain is one method to return the cost
of the undecorated drink.

### Decorator

The only thing the decorator needs is a slot to hold a concrete compoment (or
other object that implements the cost method).  Then each concrete decorator
can inherit this slot.

Create a CondimentDecorator module with an initializer taking an argument to
set the CondimentDecorator's concrete component field.

We could also implement method\_missing in the module to forward all requests
to the wrapped object.

### ConcreteDecorator

Create new classes for each of the condiments, all of which mixin the
CondimentDecorator, and all of which have a cost method that returns the cost
of the condiment plus the cost of the wrapped object.

Now we can do this at runtime
```ruby
my_drink = SteamedMilk.new(Whip.new(DarkRoast.new))
```
and the cost of my_drink will be calculated as $0.10 + $0.10 + $0.99.
