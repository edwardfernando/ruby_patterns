require './condiment_decorator'

class SteamedMilk
  include CondimentDecorator

  def cost
    0.10 + @beverage.cost
  end
end
