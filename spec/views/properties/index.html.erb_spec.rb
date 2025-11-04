require 'rails_helper'

RSpec.describe "properties#index", type: :request do
  it "retorna lista em JSON" do
    create_list(:property, 2)
    get "/properties", as: :json
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to be_an(Array)
  end
end
