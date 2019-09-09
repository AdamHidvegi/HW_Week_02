class Bar

  attr_reader :bar_name, :cash, :drinks, :stock_drink

  def initialize(bar_name, cash)
    @bar_name = bar_name
    @cash = cash
    @drinks = drinks
    @stock_drink = 16
  end

  def guest_age_check(guest)
    if guest.age() >= 18
      return true
    else
      return false
    end
  end
# more money for the bar
  def pay_for_entry(room)
    @cash += room.entry_fee()
  end
# removing one drink from the bar
  def remove_a_drink()
    @stock_drink -= 1
  end
# more money for the bar
  def drink_cash(drink)
    @cash += drink.price()
  end
# guest is paying for a drink
  def guest_get_a_drink(guest, drink)
    if guest_age_check(guest) == true && @stock_drink > 0
      guest.decrease_money_for_drink(drink)
      remove_a_drink()
      drink_cash(drink)
    else
      return "You are too young for this!"
    end
  end

end
