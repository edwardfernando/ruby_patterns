require './turkey.rb'

class TurkeyAdapter

  def initialize(turkey)
    @adaptee = turkey
  end

  def quack
    @adaptee.gobble
  end

  def fly
    5.times do
      @adaptee.fly
    end
  end

end
