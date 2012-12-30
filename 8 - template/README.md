# Template pattern

## Problem

Suppose we want to program some machine to make coffee and tea.  The
instructions are:

### Coffee
1. Boil some water
2. Brew coffee in boiling water
3. Pour coffee in cup
4. Add sugar and milk

### Tea
1. Boil some water
2. Steep tea in boiling water
3. Pour tea in cup
4. Add lemon

The instructions are almost the same.  A naive approach is to create two
different classes for each, looking something like
```Ruby
class Coffee

def prepare
boil_water
brew_coffee_grinds
pour_in_cup
add_sugar_and_milk
end

def boil_water
# boil water
end

def brew_coffee_grinds
# do something
end

...

end

class Tea

def prepare
boil_water
steep_tea
pour_in_cup
add_lemon
end

def boil_water
# boil water
end

def steep_tea
# do something
end
...
end
```

There's quite a bit of code duplication.

## Solution

Use the template pattern!  Not only do both sets of instructions have some of
the same methods between both of them, but the different instructions can be
further generalized.  Then the instruction sequence itself can be abstracted
out.

### The template method

In Java, this would go in an abstract class.  Since Ruby has no such thing, we
only need to provide a common interface for the Coffee and Tea classes.

There are a couple ways to make this work in Ruby.

#### Use inheritance

This is the usual way in which the pattern is presented. Ensure that you use
this pattern is the correct context.  For example, don't introduce a false
"is-a" relationship in order to use this pattern.  Remember that composition
is favoured over inheritance.

#### Use mixins

Instead of having the template method defined in a superclass, define it in a
module.  Then any classes that implement the neccessary methods for the
templated algorithm are free to mixin the template without needing to extend 
a class.
