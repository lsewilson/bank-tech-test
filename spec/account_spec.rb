require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#transactions' do
    it 'initializes with a zero transactions' do
      expect(account.transactions).to be_empty
    end
  end

end
