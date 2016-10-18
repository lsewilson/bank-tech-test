require_relative './credit_transaction.rb'
require_relative './debit_transaction.rb'
require_relative './statement.rb'

class Account

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, time = Time.new, transaction_class = CreditTransaction)
    @transactions << transaction_class.new(amount, time)
  end

  def withdraw(amount, time = Time.new, transaction_class = DebitTransaction)
    @transactions << transaction_class.new(amount, time)
  end

  def print_statement(statement_class = Statement)
    statement_class.new(@transactions)
  end

end
