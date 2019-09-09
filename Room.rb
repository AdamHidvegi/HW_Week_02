class Room

  attr_reader :name, :songs, :capacity, :entry_fee, :number, :population, :entry

  def initialize(name, songs, capacity, number, entry_fee, population)
    @name = name
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee
    @number = number
    @population = population
    @entry = []
  end
# guest is entering the room, first step, checking there isn't any duplicate guest
  def guest_check(guest)
    @entry.push(guest)
    @entry.uniq()
  end
# guest is entering the room, second step
  def guest_check_in(guest)
      guest_check(guest)
      @population += 1
  end
# guest is leaving the room
  def guest_check_out(guest)
    if @population > 0
      @entry.delete(guest)
      @population -= 1
    else
      return 0
    end
  end
# guest is paying for entering the room
  def check_entry_fee(guest, room, bar)
    if guest.money() >= room.entry_fee()
      guest.decrease_money_for_entry(room)
      guest_check_in(guest)
      bar.pay_for_entry(room)
      guest_fav_song(guest)
    elsif guest.money() < room.entry_fee()
      return "You can't get in!"
    end
  end
# is there enough space for everyone?
  def free_space()
    if @capacity >= @entry.length()
      return "Enjoy your evening!"
    else
      @entry.delete_at(2)
      @entry.delete_at(3)
      return "There is no room for you!"
    end
  end
# checking the guest's favourite song is on the playlist
  def guest_fav_song(guest)
    if @songs.include?(guest.fav_song())
      return "WHOOOOO"
    else
      return "BOOOOO"
    end
  end

end
