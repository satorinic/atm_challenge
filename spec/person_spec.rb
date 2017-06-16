require './lib/person'
require './lib/atm'

describe Person do

  subject { described_class.new(name: 'Niclas') }
