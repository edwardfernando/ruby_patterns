# Simple Factory Pattern

## Problem

Given many concrete classes that all implement one interface, where the decision
of which concrete class to instantiate is made at runtime depending on some set
of conditions, how do we encode the decision logic without resorting to a long
if-else-if statement?  Concrete classes may be added or removed later, which
means the if-else-if statement will need changing each time this happens.

For example, suppose we have a pizza store class with a method orderPizza that
creates and returns many different types of pizzas.  Each type of pizza has its
own methods: prepare, bake, cut, and box.

## Solution

Use a Simple Factory!  This isn't a real pattern.  Instead of letting the
order\_pizza method determine which pizza to create, we **pull that logic out into
a simple factory class**.

### Common interface

This might be needed if the concrete classes all have common behaviour.  Then
the concrete classes could all extend a base class, or mixin a module.  In our
pizza example, each pizza has its own version of the prepare, bake, cut, and box
methods. But we want to return an instance of Pizza, so we'll have a Pizza
class with some methods that can be overridden by subclasses. 

### Concrete Products 

Create classes for all the different pizzas, all of which extend the Pizza class.
Methods can be overridden here if needed.

### Simple Factory

This PizzaFactory class contains only one method, create\_pizza, that returns a
Pizza.  The method takes a string argument which is used to determine which
type of pizza to instantiate.

### Client

Finally, the PizzaStore class has an initializer that takes the PizzaFactory
and stores it in a variable.  Then the order\_pizza method takes a string and
passes it to the PizzaFactory to create the Pizza, prepares, bakes, boxes, cuts
and returns the pizza.
