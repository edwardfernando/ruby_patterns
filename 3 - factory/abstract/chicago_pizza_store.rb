require './pizza_store'
require './chicago_style_cheese_pizza'
require './chicago_style_veggie_pizza'

class ChicagoPizzaStore < PizzaStore

  def create_pizza(type)
    case type
    when "cheese"
      ChicagoStyleCheesePizza.new
    when "veggie"
      ChicagoStyleVeggiePizza.new
    else
      nil
    end
  end

end
