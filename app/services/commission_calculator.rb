class CommissionCalculator
  DEFAULT_RATE = 0.05

  def self.call(price_cents, rate: DEFAULT_RATE)
    (price_cents * rate).to_i
  end
end
