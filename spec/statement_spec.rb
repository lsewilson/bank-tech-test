require 'statement'

describe Statement do

  subject(:statement) { described_class.new }

  let(:transaction1) { double :transaction, time: Time.new(2012,01,10), type: :credit, amount: 1000 }
  let(:transaction2) { double :transaction, time: Time.new(2012,01,13), type: :credit, amount: 2000 }
  let(:transaction3) { double :transaction, time: Time.new(2012,01,14), type: :debit, amount: 500 }

  describe '#view' do

    it 'renders a view of all transactions' do
      transactions = [transaction1, transaction2, transaction3]

      receipt =
      "date || credit || debit || balance\n14/01/2012 || || 500 || 2500\n13/01/2012 || 2000 || || 3000\n10/01/2012 || 1000 || || 1000\n"

      expect { statement.view(transactions) }.to output(receipt).to_stdout
    end

  end

end
