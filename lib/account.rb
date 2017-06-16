class Account
  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :balance, :exp_date, :account_status, :owner

  def initialize(attrs = {})
    @pin_code = generate_pin
    @balance = 0
    @exp_date = set_exp_date
    @account_status = :active
    @owner = set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def generate_pin
    rand(1000..9999)
  end

  def set_exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def set_owner(obj)
    obj == nil ?  missing_owner : obj
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
