class Dice
  attr_accessor :amount

  def initialize(amount = 2)
    @amount = amount
  end

  def roll
    low = 1 * amount
    high = 6 * amount
    Random.rand(low..high)
  end

  def set_amount(new_amount)
    if(new_amount < 1 or new_amount > 3)
      raise StandardError.new("Bad number")
    else
      @amount = new_amount
    end
  end

  def get_amount
    @amount
  end
end
