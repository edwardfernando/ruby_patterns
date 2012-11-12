require 'stringio'

require 'test/unit'

require './duck.rb'
require './turkey.rb'
require './turkey_adapter.rb'

# this allows me to capture output from puts calls.
module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end


class AdapterTest < Test::Unit::TestCase

  def test_duck_quack
    mallard = Duck.new
    out = capture_stdout do
      mallard.quack
    end

    assert_equal "Quack!\n", out.string
  end

  def test_duck_fly
    mallard = Duck.new
    out = capture_stdout do
      mallard.fly
    end

    assert_equal "I'm flying\n", out.string
  end

  def test_turkey_gobble
    wild_turkey = Turkey.new
    out = capture_stdout do
      wild_turkey.gobble
    end

    assert_equal "Gobble gobble!\n", out.string
  end

  def test_turkey_fly
    wild_turkey = Turkey.new
    out = capture_stdout do
      wild_turkey.fly
    end

    assert_equal "I'm flying a short distance\n", out.string
  end

  def test_adapter_quack
    wild_turkey = Turkey.new
    not_a_duck = TurkeyAdapter.new(wild_turkey);
    out = capture_stdout do
      not_a_duck.quack
    end

    assert_equal "Gobble gobble!\n", out.string
  end

  def test_adapter_fly
    wild_turkey = Turkey.new
    not_a_duck = TurkeyAdapter.new(wild_turkey);
    out = capture_stdout do
      not_a_duck.fly
    end

    assert_equal "I'm flying a short distance\n"*5, out.string
  end

end
