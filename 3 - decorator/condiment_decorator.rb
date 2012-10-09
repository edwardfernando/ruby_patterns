module CondimentDecorator

  # decorate the object by wrapping it.  Note that any object can be wrapped!
  def initialize(beverage)
    @beverage = beverage
  end

  # By default, forward all requests to the wrapped obj.
  # New behavior is defined in the classes which 'include' this module.
  def method_missing(symbol, *args)
    @beverage.send(symbol, *args)
  end
end
