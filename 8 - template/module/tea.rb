require './caffeine_beverage.rb'

class Tea
  include CaffeineBeverage

  def brew
    "Steep tea in boiled water"
  end

  def add_condiments
    "Add lemon"
  end

end
