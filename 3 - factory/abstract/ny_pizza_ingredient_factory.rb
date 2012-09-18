require './thin_crust_dough.rb'
require './marinara_sauce.rb'
require './reggiano_cheese.rb'
require './sliced_pepperoni.rb'
require './fresh_clams.rb'

class NyPizzaIngredientFactory
  def create_dough
    ThinCrustDough.new
  end

  def create_sauce
    MarinaraSauce.new
  end

  def create_cheese
    ReggianoCheese.new
  end

  def create_veggies
    ["garlic", "onion", "mushrooms", "red peppers"]
  end

  def create_pepperoni
    SlicedPepperoni.new
  end

  def create_clam
    FreshClams.new
  end
end
