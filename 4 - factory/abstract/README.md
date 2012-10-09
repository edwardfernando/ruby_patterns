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
set of ingredients from with the set of all possible ingredients.  The book
example has two stores (NY and Chicago), each with their own implementation
of 4 types of pizza (veggie, cheese, pepperoni, and clam).

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

The pizzas Concrete Products are the different types of doughs, sauces, cheeses,
and clams.

### Abstract and Concrete Factories

No abstract classes in Ruby, so implement only the Concrete Factories.  The
Concrete Factories must implement a common API so that the Client can does not
need to distinguish between different factories.  For ingredient factories, the
API is create\_dough, create\_sauce, create\_cheese, create\_veggies,
create\_pepperoni, create\_clam.

### Client

The Client is the Pizza.  It's composed at runtime with a Concrete Factory to
create a family of related products.  Since there are 4 different types of
pizza, we create 4 subclasses of Pizza.  Each initializer takes a Concrete
Factory object.

### Hooking it up

We haven't covered the pizza stores yet.  They aren't really part of the
pattern, but they are where the Client is composed at runtime with a Concrete
Factory.  We'll have two stores, one that uses the NY factory, and the other
that uses the Chicago factory.  Each store has a method create\_pizza that
takes a String arg and uses it to decide which type of pizza to return.
