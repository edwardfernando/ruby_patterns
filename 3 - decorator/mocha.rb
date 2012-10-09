require './condiment_decorator'

class Mocha
  include CondimentDecorator

  def cost
    0.20 + @beverage.cost
  end
end
