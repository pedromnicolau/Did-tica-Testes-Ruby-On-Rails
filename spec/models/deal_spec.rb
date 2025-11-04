require 'rails_helper'

RSpec.describe Deal, type: :model do
  it { should belong_to(:property) }
  it { should belong_to(:lead) }
  it { should validate_numericality_of(:price_cents).is_greater_than(0) }
end
