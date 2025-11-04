require 'rails_helper'

RSpec.describe "properties#update", type: :request do
  it "atualiza via JSON e retorna 2xx" do
    property = create(:property, title: "Antigo")
    patch "/properties/#{property.id}", params: { property: { title: "Novo" } }, as: :json
    expect(response.status).to satisfy { |s| [ 200, 204 ].include?(s) }
  end
end
