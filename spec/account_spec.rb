require 'account'

describe Account do

  subject(:account) { described_class.new(transaction_class) }

  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction }
  let(:type) { double :transaction_type }
  let(:time) { double :time_class }
  let(:amount) { double :amount}

  describe '#transactions' do
    it 'initializes with a zero transactions' do
      expect(account.transactions).to be_empty
    end
  end

  describe '#deposit' do

    it 'creates a new credit transaction and pushes it to transactions ' do
      account.deposit(amount, time)
      expect(account.transactions).to include transaction
    end

  end

  describe '#withdraw' do

    it 'creates a new debit transaction and pushes it to transactions' do
      account.withdraw(amount, time)
      expect(account.transactions).to include transaction
    end

    it 'pushes an updated balance to the balances array' do

    end
  end

  describe '#print_statement' do

    let(:statement) { double :statement }

    it 'returns a statement summary' do
      allow(statement).to receive(:view)
      account.print_statement(statement)
      expect(statement).to have_received(:view).with(account.transactions)
    end
  end

end
