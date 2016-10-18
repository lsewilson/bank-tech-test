class Statement
# Understands how to render transactions into a statement view
  def initialize
    @entries = []
    @balances = []
  end

  attr_reader :balances

  def view(transactions)
    puts header
    transactions.each do |transaction|
      date = transaction.time.strftime("%e/%m/%Y")
      string = "#{date} || "
      if transaction.type == :credit
        string << "#{transaction.amount} || || "
        if @balances.length > 0
          @balances << @balances.last + transaction.amount
        else
          @balances << transaction.amount
        end
      elsif transaction.type == :debit
        string << "|| #{transaction.amount} || "
        if @balances.length > 0
          @balances << @balances.last - transaction.amount
        else
          @balances << transaction.amount
        end
      end
      string << "#{@balances.last}\n"
      @entries << string
    end
    @entries.reverse.each do |entry|
      puts entry
    end
  end

  private

  def header
    "date || credit || debit || balance"
  end

end
