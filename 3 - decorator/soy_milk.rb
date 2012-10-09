require './condiment_decorator'

class SoyMilk
  include CondimentDecorator

  def cost
    0.15 + @beverage.cost
  end
end
