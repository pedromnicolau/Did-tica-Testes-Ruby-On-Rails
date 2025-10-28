# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer_mailer
class LeadMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/lead_mailer_mailer/welcome
  def welcome
    LeadMailer.welcome
  end

end
