require("minitest/autorun")
require("minitest/rg")
require_relative("../Drink.rb")
require_relative("../Room.rb")
require_relative("../Guest.rb")

class DrinkTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Vodka", 6)
    @drink4 = Drink.new("Cider", 4)

    @drinks = [@drink1, @drink2, @drink3, @drink4]
  end

  def test_name()
    assert_equal("Beer", @drink1.name())
  end

  def test_price()
    assert_equal(6, @drink3.price())
  end

end
