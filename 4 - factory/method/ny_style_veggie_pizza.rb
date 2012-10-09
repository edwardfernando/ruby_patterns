require './pizza'

class NyStyleVeggiePizza < Pizza

  def initialize
    @name = "NY Style Veggie Pizza"
    @dough = "Thin Crust Dough"
    @sauce = "Low Sodium Tomato Sauce"
    @toppings = [
      "mozzarella cheese",
      "pramigiano reggiano cheese",
      "green bell pepper",
      "onion",
      "spinach",
      "mushrooms",
      "basil"
    ]
  end
end
