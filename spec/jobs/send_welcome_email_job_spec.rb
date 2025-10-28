require 'rails_helper'

RSpec.describe SendWelcomeEmailJob, type: :job do
  it "enfileira e executa" do
    lead = create(:lead)
    expect {
      described_class.perform_now(lead.id)
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
