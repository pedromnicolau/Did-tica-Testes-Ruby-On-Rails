# spec/system/home_spec.rb
require 'rails_helper'

RSpec.describe 'Home', type: :system do
  it 'abre a página inicial' do
    visit '/'
    expect(page).to have_content('Imobiliária')
  end
end
