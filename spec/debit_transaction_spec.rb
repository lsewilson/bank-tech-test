require 'debit_transaction'

describe DebitTransaction do

  subject(:transaction) { described_class.new(time, amount) }
  let(:time) { double :time_class}
  let(:amount) { double :amount }

  it 'initializes with a date' do
    expect(transaction.time).to eq time
  end

  it 'initializes with an amount' do
    expect(transaction.amount).to eq amount
  end

end
