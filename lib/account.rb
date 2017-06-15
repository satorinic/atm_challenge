class Account
  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :balance, :exp_date

  def initialize
    @pin_code = generate_pin
    @balance = 0
    @exp_date = set_exp_date


  end

  private
  def generate_pin
    rand(1000..9999)
  end

  def set_exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end
end
