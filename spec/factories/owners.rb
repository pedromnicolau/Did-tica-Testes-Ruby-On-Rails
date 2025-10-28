FactoryBot.define do
  factory :owner do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
