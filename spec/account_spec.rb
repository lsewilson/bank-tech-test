require 'account'

describe Account do

  subject(:account) { described_class.new }

  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction }
  let(:time) { double :time_class }
  let(:amount) { double :amount}

  describe '#transactions' do
    it 'initializes with a zero transactions' do
      expect(account.transactions).to be_empty
    end
  end

  describe '#deposit' do

    it 'creates a new credit transaction and pushes it to transactions ' do
      account.deposit(amount, time, transaction_class)
      expect(account.transactions).to include transaction
    end

  end

  describe '#withdraw' do

    it 'creates a new debit transaction and pushes it to transactions' do
      account.withdraw(amount, time, transaction_class)
      expect(account.transactions).to include transaction
    end
  end

  describe '#print_statement' do

    let(:statement_class) { double :statement_class }

    it 'returns a statement summary' do
      allow(statement_class).to receive(:new)
      account.print_statement(statement_class)
      expect(statement_class).to have_received(:new).with(account.transactions)
    end
  end

end
