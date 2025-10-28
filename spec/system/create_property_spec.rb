require 'rails_helper'

RSpec.describe "Criar Property", type: :system do
  it "cria via formulário" do
    owner = create(:owner)
    visit new_property_path
    fill_in "Title", with: "Casa verde"
    fill_in "Address", with: "Rua A, 123"
    fill_in "City", with: "Araras"
    fill_in "State", with: "SP"
    fill_in "Zip", with: "13600-000"
    fill_in "Price cents", with: "50000000"
    select owner.name, from: "Owner"
    click_on "Create Property"
    # The app shows the created property's details page — assert on visible data
    expect(page).to have_content("Casa verde")
    expect(page).to have_content(owner.name)
  end
end
