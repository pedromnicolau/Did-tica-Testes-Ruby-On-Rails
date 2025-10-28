require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:owner) }
  it { should have_many(:visits).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:price_cents).is_greater_than(0) }

  describe '.in_city' do
    it 'filtra pela cidade' do
      p1 = create(:property, city: 'Araras')
      _p2 = create(:property, city: 'Leme')
      expect(Property.in_city('Araras')).to include(p1)
    end
  end
end
