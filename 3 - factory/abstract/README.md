# Abstract Factory Method

## Motivation

Provide an interface for creating families of related objects without specifying
their concrete classes.

## Problem

Looking again at the pizza store, our previous Pizza class contained dough,
sauce and toppings, all defined as Strings within the subclasses of Pizza.  The
creation of the ingredients is not decoupled from the subclasses of Pizza.

Suppose we want to ensure that the pizza stores all get the pizza supplies
from a common pool of suppliers, but still have the ability to customize the
set of ingredients from with the set of all possible ingredients.

## Solution

Use the Abstract Factory Pattern!  Abstract the creation of the pizza
ingredients away from the Pizza subclasses by using factories to build and
return the ingredients.  Each factory will return a complete set of ingredients
for s specific pizza.

### Abstract and Concrete Products

We don't need abstract products in Ruby.  If we needed to perform some type of
operations on the concrete products, we would need to ensure that each concrete
producs implemented a family specific API.  That's the equivalent of having an
interface per family.

The pizzas concrete products are the different types of doughs, sauces, cheeses,
and clams.

### Abstract and Concrete Factories

No abstract classes in Ruby, so implement only the concrete factories.  Each
concrete factory must implement a common API so that the Client can does not
need to distinguish between different factories.  For Pizzas, we use
create\_dough, create\_sauce, create\_cheese, create\_veggies,
create\_pepperoni, create\_clam.

### Client

The Client is the Pizza.
