require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#transactions' do
    it 'initializes with a zero transactions' do
      expect(account.transactions).to be_empty
    end
  end

  describe '#deposit' do

    let(:transaction_class) { double :transaction_class, new: transaction }
    let(:transaction) { double :transaction }
    let(:time) { double :time_class }
    let(:amount) { double :amount}

    it 'creates a new credit transaction and pushes it to transactions ' do
      account.deposit(amount, time, transaction_class)
      expect(account.transactions).to include transaction
    end
  end

end
