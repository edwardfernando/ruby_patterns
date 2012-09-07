require 'test/unit'
require './pizza'
require './cheese_pizza'
require './veggie_pizza'
require './pizza_store'
require './pizza_factory'

class SimpleFactoryTest < Test::Unit::TestCase

  def test_factory
    factory = PizzaFactory.new
    assert(factory.createPizza("cheese").instance_of(CheesePizza))
    assert(factory.createPizza("veggie").instance_of(VeggiePizza))
  end

  def test_store_init
    factory = PizzaFactory.new
    store = PizzaStore.new(factory)
    assert_equal(store.factory, factory)
  end

  def test_order_pizza
    store = PizzaStore.new(PizzaFactory.new)
    assert(store.orderPizza("cheese").instance_of(CheesePizza))
    assert(store.orderPizza("veggie").instance_of(VeggiePizza))
  end

end
