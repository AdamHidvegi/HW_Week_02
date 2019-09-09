require("minitest/autorun")
require("minitest/rg")
require_relative("../Room.rb")
require_relative("../Song.rb")
require_relative("../Guest.rb")
require_relative("../Bar.rb")

class RoomTest < MiniTest::Test

  def setup()
    @song1 = Song.new("song1")
    @song2 = Song.new("song2")
    @song3 = Song.new("song3")
    @song4 = Song.new("song4")

    @songs = [@song1, @song2, @song3, @song4]

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

  def test_room_name()
    assert_equal("room1", @room1.name())
  end

  def test_room_capacity()
    assert_equal(2, @room2.capacity())
  end

  def test_room_entry_fee()
    assert_equal(3, @room3.entry_fee())
  end

  def test_room_number()
    assert_equal(1, @room1.number())
  end

  def test_room_songs()
    assert_equal("song1", @song1.name())
  end

  def test_guest_name()
    assert_equal("Niall", @guest4.name())
  end

  def test_guest_money()
    assert_equal(40, @guest2.money())
  end

  def test_population()
    assert_equal(0, @room1.population())
  end

  def test_entry_fee()
    assert_equal(5, @room1.entry_fee())
  end

  def test_guest_check()
    @room1.guest_check(@guest1)
    assert_equal(1, @room1.entry().length())
  end

  def test_guest_check_in()
    @room1.guest_check_in(@guest1)
    assert_equal(1, @room1.population())
  end

  def test_guest_check_in__no_duplicate()
    @room1.guest_check(@guest1)
    @room1.guest_check(@guest1)
    @room1.guest_check_in(@guest1)
    assert_equal(1, @room1.population())
  end

  def test_guest_check_out()
    @room2.guest_check_in(@guest1)
    @room2.guest_check_in(@guest2)
    @room2.guest_check_out(@guest1)
    assert_equal(1, @room2.population())
  end

  def test_check_entry_fee__enough_money()
    @room2.check_entry_fee(@guest2, @room2, @bar)
    assert_equal(36, @guest2.money())
    assert_equal(1, @room2.population())
    assert_equal(1, @room2.entry().length())
    assert_equal(104, @bar.cash())
  end

  def test_check_entry_fee__not_enough_money()
    @room2.check_entry_fee(@guest1, @room2, @bar)
    result = @room2.check_entry_fee(@guest1, @room2, @bar)
    assert_equal(1, @guest1.money())
    assert_equal(0, @room2.population())
    assert_equal(0, @room2.entry().length())
    assert_equal("You can't get in!", result)
  end

  def test_free_space__yes()
    @room1.guest_check(@guest1)
    @room1.guest_check(@guest2)
    result = @room1.free_space()
    assert_equal("Enjoy your evening!", result)
  end

  def test_free_space__no()
    @room1.guest_check(@guest1)
    @room1.guest_check(@guest2)
    @room1.guest_check(@guest3)
    @room1.guest_check(@guest4)
    result = @room1.free_space()
    assert_equal("There is no room for you!", result)
  end

  def test_guest_fav_song_include_yes()
    result = @room1.guest_fav_song(@guest1)
    assert_equal("WHOOOOO", result)
  end

  def test_guest_fav_song_include_no()
    result = @room1.guest_fav_song(@guest4)
    assert_equal("BOOOOO", result)
  end

end
