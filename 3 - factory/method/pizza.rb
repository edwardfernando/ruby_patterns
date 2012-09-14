class Pizza

  attr_accessor :name, :dough, :sauce, :toppings

  def prepare
    puts "Preparing #{name}"
    puts "Tossing dough..."
    puts "Adding sauce..."
    puts "Adding toppings: " + @toppings.to_s
  end

  def bake
    puts "Bake at 350F for 20 minutes"
  end

  def cut
    puts "Cutting into triangles"
  end

  def box
    puts "Place pizza into official PizzaStore box"
  end

end
