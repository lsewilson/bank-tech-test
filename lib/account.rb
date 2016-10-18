require 'credit_transaction'

class Account

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, time, transaction_class = CreditTransaction)
    @transactions << transaction_class.new(amount, time)
  end

end
