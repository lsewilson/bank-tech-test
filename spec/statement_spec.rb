require 'statement'

describe Statement do

  subject(:statement) { described_class.new }

  describe '#format_date' do

    it 'changes the time into dd/mm/yyyy format' do
      date = Time.new(2016,10,18)
      expect(statement.format_date(date)).to eq "18/10/2016"
    end

  end

end
