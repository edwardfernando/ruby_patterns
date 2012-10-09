require './pizza.rb'

class PepperoniPizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
    puts "Preparing #{name}"
    @dough = @factory.create_dough
    @sauce = @factory.create_sauce
    @cheese = @factory.create_cheese
    @pepperoni = @factory.create_pepperoni
    @veggies = @factory.create_veggies
  end
end
