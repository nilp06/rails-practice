require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'welcome_email' do
    let(:user) { create(:user) }

    it 'sends a welcome email to the user' do
      mail = UserMailer.with(user:, f: 'html').welcome_mail
      expect(mail.subject).to eq('Welcome to Application')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq([ENV['gmail_user']])
      expect(mail.body).to include('Welcome')
    end
  end
end
