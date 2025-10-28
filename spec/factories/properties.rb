FactoryBot.define do
  factory :property do
    association :owner
    title       { "Apto #{Faker::Address.community}" }
    address     { Faker::Address.street_address }
    city        { "Araras" }
    state       { "SP" }
    zip         { "13600-000" }
    price_cents { rand(150_000..900_000) * 100 }
    status      { :available }
  end
end
