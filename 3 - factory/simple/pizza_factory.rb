require './cheese_pizza'
require './veggie_pizza'

class PizzaFactory

  def create_pizza(type)
    case(type)
    when "cheese"
      CheesePizza.new
    when "veggie"
      VeggiePizza.new
    else
      null
    end
  end

end
