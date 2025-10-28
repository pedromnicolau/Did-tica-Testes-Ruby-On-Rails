class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(lead_id)
    LeadMailer.welcome(lead_id).deliver_now
  end
end
