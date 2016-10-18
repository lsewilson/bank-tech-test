class DebitTransaction

  attr_reader :time, :amount

  def initialize(time = Time.new, amount)
    @time = time
    @amount = amount
  end

end
