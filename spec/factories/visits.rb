FactoryBot.define do
  factory :visit do
    property
    lead
    scheduled_at { 2.days.from_now.change(hour: 10) }
    status { :scheduled }
  end
end
