require './pizza'

class NyStyleCheesePizza < Pizza

  def initialize
    @name = "NY Style Sauce and Cheese Pizza"
    @dough = "Thin Crust Dough"
    @sauce = "Marinara Sauce"
    @toppings = Array.new
    @toppings << "Grated Reggiano Cheese"
  end
end
