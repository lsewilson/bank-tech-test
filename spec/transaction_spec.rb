require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new(type, amount, time)}
  let(:type) { double :type }
  let(:time) { double :time}
  let(:amount) { double :amount }

  it 'initializes with a type' do
    expect(transaction.type).to eq type
  end

  it 'initializes with a date' do
    expect(transaction.time).to eq time
  end

  it 'initializes with an amount' do
    expect(transaction.amount).to eq amount
  end

end
