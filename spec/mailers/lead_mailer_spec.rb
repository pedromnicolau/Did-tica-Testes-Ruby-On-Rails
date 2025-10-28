require 'rails_helper'

RSpec.describe LeadMailer, type: :mailer do
  it "envia e-mail de boas-vindas" do
    lead = create(:lead)
    mail = described_class.welcome(lead.id)

    expect(mail.to).to include(lead.email)
    expect(mail.subject).to include("Bem-vindo")
    expect(mail.body.encoded).to include(lead.name)
  end
end
