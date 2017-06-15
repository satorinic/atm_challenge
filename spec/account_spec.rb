require './lib/account.rb'
require 'date'

describe Account do

  it 'check the length of the pin code' do
   number = 1234
   number_length = Math.log10(number).to_i + 1
   expect(number_length).to eq 4
  end

  it 'check if the account balance is 0 on initialize' do
  expect(subject.balance).to eq 0
  end

  it 'check if the card has an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end
end
