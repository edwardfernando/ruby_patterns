class Pizza
  attr_accessor :name, :dough, :sauce, :veggies, :cheese, :pepperoni, :clam

  def bake
    puts "Bake for 25 mins at 250"
  end

  def cut
    puts "Cut into diagonal slices"
  end

  def box
    puts "Box pizza in official box"
  end

end
