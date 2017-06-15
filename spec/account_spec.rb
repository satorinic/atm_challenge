require './lib/account.rb'
require 'date'

describe Account do

  it 'check for the length of the pin code' do
   number = 1234
   number_length = Math.log10(number).to_i + 1
   expect(number_length).to eq 4
  end
 end
