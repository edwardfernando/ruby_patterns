require './condiment_decorator'

class Whip
  include CondimentDecorator

  def cost
    0.10 + @beverage.cost
  end
end
