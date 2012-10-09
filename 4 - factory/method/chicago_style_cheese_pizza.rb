require './pizza'

class ChicagoStyleCheesePizza < Pizza

  def initialize
    @name = "Chicago Style Deep Dish Cheese Pizza"
    @dough = "Extra Thick Crust Dough"
    @sauce = "Plum Tomato Sauce"
    @toppings = Array.new
    @toppings << "Shredded Mozzarella Cheese"
  end

  def cut
    puts "Cutting pizza into square slices"
  end
end
