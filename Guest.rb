class Guest

  attr_reader :name, :money, :fav_song, :age

  def initialize(name, money, fav_song, age)
    @name = name
    @money = money
    @fav_song = fav_song
    @age = age
  end
# guest's wallet is getting thiner
  def decrease_money_for_entry(room)
    @money -= room.entry_fee()
  end
# guest's wallet is getting thiner
  def decrease_money_for_drink(drink)
    @money -= drink.price()
  end

end
