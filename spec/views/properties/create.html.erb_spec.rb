require 'rails_helper'

RSpec.describe "properties#create", type: :request do
  it "cria via JSON e retorna 201" do
    owner = create(:owner)
    payload = { property: attributes_for(:property, owner_id: owner.id) }

    post "/properties", params: payload, as: :json
    expect(response).to have_http_status(:created)
  end
end
