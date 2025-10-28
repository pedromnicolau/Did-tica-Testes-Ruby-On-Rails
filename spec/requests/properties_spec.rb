require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "GET /properties" do
    it "lista com filtros" do
      target = create(:property, city: "Araras", price_cents: 300_000_00)
      _other = create(:property, city: "Leme",   price_cents: 900_000_00)

      get "/properties", params: { city: "Araras", max_price: 400_000_00 }, as: :json
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)

      # ensure every returned item matches the requested filters
      expect(json).to all(satisfy { |h| h["city"].casecmp("Araras").zero? && h["price_cents"].to_i <= 400_000_00 })

      # ensure the property we created is present in the results
      expect(json.map { |h| h["id"] }).to include(target.id)
    end
  end

  describe "POST /properties" do
    it "cria com sucesso" do
      owner = create(:owner)
      payload = { property: attributes_for(:property, owner_id: owner.id) }

      post "/properties", params: payload, as: :json
      expect(response).to have_http_status(:created)
    end

    it "retorna erro de validação" do
      post "/properties", params: { property: { title: "" } }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
