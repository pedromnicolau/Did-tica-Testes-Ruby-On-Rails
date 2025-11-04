require 'rails_helper'

RSpec.describe PropertiesHelper, type: :helper do
  describe '#property_full_address' do
    it 'concatena address, city e state' do
      property = build(:property, address: 'Rua A, 123', city: 'Araras', state: 'SP')
      expect(helper.property_full_address(property)).to eq('Rua A, 123, Araras - SP')
    end

    it 'retorna vazio quando nil' do
      expect(helper.property_full_address(nil)).to eq('')
    end
  end
end
