# Factory Method Pattern

## Motivation

The simple factory "pattern" has some problems: each time we add a new concrete
product, the factory class needs to be updated.  In other words, the factory
entity's behaviour cannot be extended without modifying its source code.  This
violates the open/closed principle.

The factory method pattern solves this, partially, by allowing the factory class
to be extended.  The extensions can then create different entities which
implement the same interface as the original factory.  The code to create the
new entites remains encapsulated within the extending factories, and there is a
common interface for all factories.

## Problem

Back to our pizza example, suppose... 
