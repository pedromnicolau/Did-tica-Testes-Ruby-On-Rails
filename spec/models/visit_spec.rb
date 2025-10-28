require 'rails_helper'

RSpec.describe Visit, type: :model do
  it { should belong_to(:property) }
  it { should belong_to(:lead) }
  it { should define_enum_for(:status).with_values(%i[scheduled done no_show]) }
  it { should validate_presence_of(:scheduled_at) }
end
