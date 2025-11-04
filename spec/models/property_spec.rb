require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:owner) }
  it { should have_many(:visits).dependent(:destroy) }
  it { should have_many(:leads).dependent(:nullify) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:price_cents).is_greater_than(0) }

  describe 'enum status' do
    it 'tem os valores corretos' do
      expect(described_class.statuses).to eq('available' => 0, 'reserved' => 1, 'sold' => 2)
    end

    it 'permite usar os predicados para cada status' do
      expect(build(:property, status: :available)).to be_available
      expect(build(:property, status: :reserved)).to be_reserved
      expect(build(:property, status: :sold)).to be_sold
    end

    it 'rejeita status inválido' do
      expect { build(:property, status: :invalido) }.to raise_error(ArgumentError)
    end
  end

  describe '.in_city' do
    it 'filtra pela cidade' do
      p1 = create(:property, city: 'Araras')
      _p2 = create(:property, city: 'Leme')
      expect(Property.in_city('Araras')).to include(p1)
    end
  end

  describe '.priced_up_to' do
    it 'filtra pelo preço máximo' do
      p1 = create(:property, price_cents: 10000000)

      expect(Property.priced_up_to('20000000')).to include(p1)
      expect(Property.priced_up_to('9900000')).not_to include(p1)
    end
  end
end
