require './pizza_store'
require './ny_style_cheese_pizza'
require './ny_style_veggie_pizza'

class NyPizzaStore < PizzaStore

  def create_pizza(type)
    case type
    when "cheese"
      NyStyleCheesePizza.new
    when "veggie"
      NyStyleVeggiePizza.new
    else
      nil
    end
  end

end
