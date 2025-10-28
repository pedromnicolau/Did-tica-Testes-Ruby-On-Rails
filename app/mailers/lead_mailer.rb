class LeadMailer < ApplicationMailer
  default from: "no-reply@realestate.test"

  def welcome(lead_id)
    @lead = Lead.find(lead_id)
    mail to: @lead.email, subject: "Bem-vindo, #{@lead.name}"
  end
end
