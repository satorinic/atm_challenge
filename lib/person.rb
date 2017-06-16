require './lib/account.rb'
require './lib/atm.rb'

class Person
  attr_accessor :name,  :cash, :account


  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil
  end


  def create_account
    @account = Account.new(owner: self)
  end
end
