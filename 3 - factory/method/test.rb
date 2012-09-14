require 'test/unit'
require './pizza'
require './ny_style_cheese_pizza'
require './chicago_style_cheese_pizza'
require './ny_style_veggie_pizza'
require './chicago_style_veggie_pizza'
require './ny_pizza_store'
require './chicago_pizza_store'

class FactoryMethodTest < Test::Unit::TestCase

  def test_pizza
    pizza = Pizza.new
    assert pizza.name.nil?
    assert pizza.dough.nil?
    assert pizza.sauce.nil?
    assert pizza.toppings.nil?
  end

  def test_ny_style_cheese_pizza
    pizza = NyStyleCheesePizza.new
    assert_equal("NY Style Sauce and Cheese Pizza", pizza.name)
    assert_equal(["Grated Reggiano Cheese"], pizza.toppings)
  end

  def test_chicago_style_cheese_pizza
    pizza = ChicagoStyleCheesePizza.new
    assert_equal("Chicago Style Deep Dish Cheese Pizza",pizza.name)
    assert_equal(["Shredded Mozzarella Cheese"], pizza.toppings)
  end

  def test_ny_style_veggie_pizza
    pizza = NyStyleVeggiePizza.new
    assert_equal("NY Style Veggie Pizza", pizza.name)
    assert_equal(["mozzarella cheese",
                 "pramigiano reggiano cheese",
                 "green bell pepper",
                 "onion",
                 "spinach",
                 "mushrooms",
                 "basil"], pizza.toppings)
  end

  def test_chicago_style_veggie_pizza
    pizza = ChicagoStyleVeggiePizza.new
    assert_equal("Chicago Style Veggie Pizza", pizza.name)
    assert_equal(["mozzarella cheese",
                 "brocolli",
                 "roasted red pepper",
                 "kalamata olives",
                 "pecorino romano cheese"], pizza.toppings)
  end

  def test_ny_pizza_store
    store = NyPizzaStore.new
    # use is_a? to ensure inheritance
    assert(store.is_a?(PizzaStore))
    # test create_pizza
    # use instance_of? to check class type
    assert(store.create_pizza("cheese").instance_of?(NyStyleCheesePizza))
    assert(store.create_pizza("veggie").instance_of?(NyStyleVeggiePizza))
    # test order_pizza
    assert(store.order_pizza("cheese").instance_of?(NyStyleCheesePizza))
    assert(store.order_pizza("veggie").instance_of?(NyStyleVeggiePizza))
  end

  def test_chicago_pizza_store
    store = ChicagoPizzaStore.new
    assert(store.is_a?(PizzaStore))
    # test create_pizza
    assert(store.create_pizza("cheese").instance_of?(ChicagoStyleCheesePizza))
    assert(store.create_pizza("veggie").instance_of?(ChicagoStyleVeggiePizza))
    # test order_pizza
    assert(store.order_pizza("cheese").instance_of?(ChicagoStyleCheesePizza))
    assert(store.order_pizza("veggie").instance_of?(ChicagoStyleVeggiePizza))
  end
end
