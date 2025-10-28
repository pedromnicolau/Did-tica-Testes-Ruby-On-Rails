require 'rails_helper'

RSpec.describe CommissionCalculator do
  it "calcula 5% por padrão" do
    expect(described_class.call(1_000_00)).to eq(5_000)
  end

  it "permite taxa customizada" do
    expect(described_class.call(1_000_00, rate: 0.03)).to eq(3_000)
  end
end
