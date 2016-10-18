require 'statement'

describe Statement do

  subject(:statement) { described_class.new(transactions)}

  transactions = [transaction1, transaction2, transaction3]

  let(:transaction1) { double :transaction, time: Time.new(2012,01,10), type: :credit, amount: 1000 }
  let(:transaction2) { double :transaction, time: Time.new(2012,01,13), type: :credit, amount: 1000 }
  let(:transaction3) { double :transaction, time: Time.new(2012,01,14), type: :debit, amount: 500 }

  describe '#view' do

    it 'renders a view of all transactions' do
      receipt =  "date || credit || debit || balance
                  14/01/2012 || || 500.00 || 2500.00
                  13/01/2012 || 2000.00 || || 3000.00
                  10/01/2012 || 1000.00 || || 1000.00"

      expect { statement.view(transactions) }.to output(receipt).to_stdout
    end

  end

end
