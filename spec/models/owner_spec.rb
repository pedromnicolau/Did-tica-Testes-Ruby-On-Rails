require 'rails_helper'

RSpec.describe Owner, type: :model do
  it { should have_many(:properties).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
