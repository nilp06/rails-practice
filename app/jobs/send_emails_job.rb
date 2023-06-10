class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user:, f: 'text').welcome_mail.deliver_now
  end
end
