class Transaction

  attr_reader :type, :time, :amount

  def initialize(type, amount, time)
    @type = type
    @time = time
    @amount = amount
  end

end
