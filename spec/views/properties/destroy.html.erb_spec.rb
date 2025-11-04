require 'rails_helper'

RSpec.describe "properties#destroy", type: :request do
  it "remove via JSON e retorna 200 ou 204" do
    property = create(:property)
    delete "/properties/#{property.id}", as: :json
    expect(response.status).to satisfy { |s| [ 200, 204 ].include?(s) }
  end
end
