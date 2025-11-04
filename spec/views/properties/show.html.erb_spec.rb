require 'rails_helper'

RSpec.describe "properties#show", type: :request do
  it "retorna um item em JSON" do
    property = create(:property)
    get "/properties/#{property.id}", as: :json
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json["id"]).to eq(property.id)
  end
end
