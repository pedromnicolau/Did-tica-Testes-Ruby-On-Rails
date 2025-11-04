require 'rails_helper'

RSpec.describe Lead, type: :model do
  it { should belong_to(:property).optional }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
