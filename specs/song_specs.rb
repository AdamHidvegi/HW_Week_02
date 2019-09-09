require("minitest/autorun")
require("minitest/rg")
require_relative("../Song.rb")


class SongTest < MiniTest::Test

  def setup()
    @song1 = Song.new("song1")
    @song2 = Song.new("song2")
    @song3 = Song.new("song3")
    @song4 = Song.new("song4")

    @songs = [@song1, @song2, @song3, @song4]
  end

  def test_song_name()
    assert_equal("song2", @song2.name())
  end

end
