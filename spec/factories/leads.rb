FactoryBot.define do
  factory :lead do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    property
  end
end
