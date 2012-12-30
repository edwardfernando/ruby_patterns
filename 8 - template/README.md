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
