require './thick_crust_dough.rb'
require './plum_tomato_sauce.rb'
require './mozzarella.rb'
require './sliced_pepperoni.rb'
require './frozen_clams.rb'

class ChicagoPizzaIngredientFactory
  def create_dough
    ThickCrustDough.new
  end

  def create_sauce
    PlumTomatoSauce.new
  end

  def create_cheese
    Mozzarella.new
  end

  def create_veggies
    ["black olives", "spinach", "eggplant"]
  end

  def create_pepperoni
    SlicedPepperoni.new
  end

  def create_clam
    FrozenClams.new
  end
end
