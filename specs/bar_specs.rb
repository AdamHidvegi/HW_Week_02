require("minitest/autorun")
require("minitest/rg")
require_relative("../Bar.rb")
require_relative("../Drink.rb")
require_relative("../Guest.rb")
require_relative("../Room.rb")

class BarTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Vodka", 6)
    @drink4 = Drink.new("Cider", 4)

    @drinks = [@drink1, @drink2, @drink3, @drink4]

    @room1 = Room.new("room1", @songs, 2, 1, 5, 0)
    @room2 = Room.new("room2", @songs, 2, 2, 4, 0)
    @room3 = Room.new("room3", @songs, 2, 3, 3, 0)

    @rooms = [@room1, @room2, @room3]

    @guest1 = Guest.new("Adam", 1, @song1, 15)
    @guest2 = Guest.new("Jordan", 40, @song2, 25)
    @guest3 = Guest.new("Colin", 30, @song3, 17)
    @guest4 = Guest.new("Niall", 20, @song5, 30)

    @guests = [@guest1, @guest2, @guest3, @guest4]

    @bar = Bar.new("The Bar", 100)
  end

  def test_bar_name()
    assert_equal("The Bar", @bar.bar_name())
  end

  def test_bar_cash()
    assert_equal(100, @bar.cash())
  end

  def test_guest_age_check__true()
    result = @bar.guest_age_check(@guest2)
    assert_equal(true, result)
  end

  def test_guest_age_check__false()
    result = @bar.guest_age_check(@guest1)
    assert_equal(false, result)
  end

  def test_pay_for_entry()
    @bar.pay_for_entry(@room1)
    assert_equal(105, @bar.cash())
  end

  def test_drink_cash()
    @bar.drink_cash(@drink3)
    assert_equal(106, @bar.cash())
  end

  def test_remove_a_drink()
    @bar.remove_a_drink()
    assert_equal(15, @bar.stock_drink())
  end

  def test_guest_get_a_drink__yes()
    @bar.guest_get_a_drink(@guest2, @drink4)
    assert_equal(36, @guest2.money())
    assert_equal(15, @bar.stock_drink())
    assert_equal(104, @bar.cash())
  end

  def test_guest_get_a_drink__no()
    @bar.guest_get_a_drink(@guest3, @drink4)
    result = @bar.guest_get_a_drink(@guest3, @drink4)
    assert_equal(30, @guest3.money())
    assert_equal(16, @bar.stock_drink())
    assert_equal("You are too young for this!", result)
    assert_equal(100, @bar.cash())
  end

end
