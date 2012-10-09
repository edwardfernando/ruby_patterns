require 'test/unit'
require './dark_roast'
require './soy_milk'
require './steamed_milk'

class DecoratorTest < Test::Unit::TestCase

  def test_decorators
    drink = DarkRoast.new
    assert_equal(0.99, drink.cost)
    drink = SoyMilk.new(drink)
    assert_equal(0.99 + 0.15, drink.cost)
    drink = SteamedMilk.new(drink)
    assert_equal(0.99 + 0.15 + 0.10, drink.cost)

    other_drink = SteamedMilk.new(SoyMilk.new(DarkRoast.new))
    assert_equal(drink.cost, other_drink.cost)
  end

  def test_wrap_bad_object
    does_not_implment_cost = 5
    drink = SteamedMilk.new(does_not_implment_cost)
    assert_raise NoMethodError do
      drink.cost
    end
  end

  def test_method_missing
    other_drink = SteamedMilk.new(SoyMilk.new(DarkRoast.new))
    assert_raise NoMethodError do
      other_drink.empty?
    end
  end
end
