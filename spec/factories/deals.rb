FactoryBot.define do
  factory :deal do
    property
    lead
    price_cents { property.price_cents }
    signed_at   { Time.current }
  end
end
