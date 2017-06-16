require './lib/person'
require './lib/atm'

describe Person do

subject { described_class.new(name: 'Niclas') }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it ' is expected to raise errror if o name set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end

  it 'is expected to have a :cash attribute with value of 0 on initialize' do
  expect(subject.cash).to eq 0
  end

  it 'is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end

describe'can create an Account'

  before { subject.create_account }

  it 'of Account class ' do
  expect(subject.account).to be_an_instance_of Account
  end

  it 'with himself as an owner' do
      expect(subject.account.owner).to be subject
  end
end
