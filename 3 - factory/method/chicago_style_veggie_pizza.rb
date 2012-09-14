require './pizza'

class ChicagoStyleVeggiePizza < Pizza

  def initialize
    @name = "Chicago Style Veggie Pizza"
    @dough = "Extra Thick Crust Dough"
    @sauce = "Tomato Sauce"
    @toppings = [
      "mozzarella cheese",
      "brocolli",
      "roasted red pepper",
      "kalamata olives",
      "pecorino romano cheese"] 
  end

  def cut
    puts "Cutting pizza into square slices"
  end
end
