require_relative './transaction.rb'
require_relative './statement.rb'

class Account

  attr_reader :transactions

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def deposit(amount, time = Time.new)
    @transactions << @transaction_class.new(:credit, amount, time)
  end

  def withdraw(amount, time = Time.new)
    @transactions << @transaction_class.new(:debit, amount, time)
  end

  def print_statement(statement_class = Statement)
    statement_class.new(@transactions)
  end

end
