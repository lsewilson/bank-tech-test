class Statement
# Understands how to render transaction history into a statement view

  def initialize
    @entries = []
    @balances = []
  end

  def view(transactions)
    header
    render_entries(transactions)
    list_entries
  end

  private

  def header
    puts "date || credit || debit || balance"
  end

  def format_date(time)
    time.strftime("%e/%m/%Y")
  end

  def render_entries(transactions)
    transactions.each do |transaction|
      amount = transaction.amount
      string = "#{format_date(transaction.time)} || "
      if transaction.type == :credit
        string << "#{amount} || || "
        @balances.length > 0 ? @balances << @balances.last + amount : @balances << amount
      else
        string << "|| #{amount} || "
        @balances.length > 0 ? @balances << @balances.last - amount : @balances << amount
      end
      string << "#{@balances.last}"
      @entries << string
    end
  end

  def list_entries
    @entries.reverse.each{|e| puts e}
  end

end
