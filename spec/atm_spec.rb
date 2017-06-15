require './lib/atm.rb'
require 'date'

describe Atm do
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/18', account_status: :active) }

  before do

    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

    it 'reject withdraw if card is expired' do
      allow(account).to receive(:exp_date).and_return('12/15')
      expected_output = { status: false, message: 'card expired', date: Date.today }
      expect(subject.withdraw(10, '1234', account)).to eq expected_output
    end

    it 'reject withdraw if card is not active' do
      allow(account).to receive(:account_status).and_return(:disabled)
      expected_output = { status: false, message: 'card is not active', date: Date.today }
      expect(subject.withdraw(75, '1234', account)).to eq expected_output

    end

    it 'allow withdraw if account has enough balance.' do
       expected_output = {
         status: true,
         message: 'success',
         date: Date.today,
         amount: 45,
         bills: [20, 20, 5] }
       expect(subject.withdraw(45, '1234', account)).to eq  expected_output
    end

    it 'has $1000 in initialize' do
       expect(subject.funds).to eq 1000
    end

    it 'funds are reduced at withdraw' do
       subject.withdraw(50, '1234', account)
       expect(subject.funds).to eq 950
    end

    it 'rejects withdraw if account has insufficient funds' do
      expected_output = {status: false, message: 'insufficient funds', date: Date.today }
      expect(subject.withdraw(105, '1234', account)).to eq expected_output
    end

    it 'reject withdraw if ATM has insufficient funds' do
      subject.funds = 50
      expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
      expect(subject.withdraw(100, '1234', account)).to eq expected_output
    end

    it 'reject withdraw if pin is wrong' do
      expected_output = { status: false, message: 'wrong pin', date: Date.today }
      expect(subject.withdraw(50, '9999', account)).to eq expected_output
    end
end
