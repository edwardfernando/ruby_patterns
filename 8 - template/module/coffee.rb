require './caffeine_beverage.rb'

class Coffee
  include CaffeineBeverage

  def brew
    "Drip coffee through filter"
  end

  def add_condiments
    "Add sugar and milk"
  end

end
