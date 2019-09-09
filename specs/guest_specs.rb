require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest.rb")
require_relative("../Room.rb")
require_relative("../Song.rb")
require_relative("../Bar.rb")
require_relative("../Drink.rb")

class GuestTest < MiniTest::Test

  def setup()
    @song1 = Song.new("song1")
    @song2 = Song.new("song2")
    @song3 = Song.new("song3")
    @song4 = Song.new("song4")

    @songs = [@song1, @song2, @song3, @song4]

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Vodka", 6)
    @drink4 = Drink.new("Cider", 4)

    @drinks = [@drink1, @drink2, @drink3, @drink4]

    @guest1 = Guest.new("Adam", 1, @song1, 15)
    @guest2 = Guest.new("Jordan", 40, @song2, 25)
    @guest3 = Guest.new("Colin", 30, @song3, 17)
    @guest4 = Guest.new("Niall", 20, @song5, 30)

    @guests = [@guest1, @guest2, @guest3, @guest4]

    @room1 = Room.new("room1", @songs, 2, 1, 5, 0)
    @room2 = Room.new("room2", @songs, 2, 2, 4, 0)
    @room3 = Room.new("room3", @songs, 2, 3, 3, 0)

    @rooms = [@room1, @room2, @room3]
  end

  def test_name()
    assert_equal("Adam", @guest1.name())
  end

  def test_money()
    assert_equal(1, @guest1.money())
  end

  def test_fav_song()
    assert_equal(@song1, @guest1.fav_song())
  end

  def test_age()
    assert_equal(15, @guest1.age())
  end

  def test_decrease_money_for_entry()
    @guest3.decrease_money_for_entry(@room1)
    assert_equal(25, @guest3.money())
  end

  def test_decrease_money_for_drink()
    @guest2.decrease_money_for_drink(@drink1)
    assert_equal(36, @guest2.money())
  end

end
