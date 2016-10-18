class CreditTransaction

  attr_reader :time, :amount

  def initialize(amount, time = Time.new)
    @time = time
    @amount = amount
  end

end
