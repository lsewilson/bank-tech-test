class DebitTransaction

  attr_reader :time, :amount

  def initialize(amount, time)
    @time = time
    @amount = amount
  end

end
