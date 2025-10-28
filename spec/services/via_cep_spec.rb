require 'rails_helper'

RSpec.describe ViaCep do
  it "retorna JSON com stub (WebMock)" do
    stub_request(:get, %r{viacep.com.br/ws/13600-000/json/})
      .to_return(status: 200, body: { localidade: "Araras" }.to_json)

    json = described_class.fetch("13600-000")
    expect(json["localidade"]).to eq("Araras")
  end
end
