class UserMailer < ApplicationMailer
  default from: ENV['email']
  layout 'custom', only: [:email_changed]
  def welcome_mail
    @user = params[:user]
    @f = params[:f]
    mail(to: @user.email, subject: 'Welcome to Application') do |format|
      @f == 'html' ? format.html : format.text
    end
  end

  def email_changed
    @user = params[:user]
    mail(to: @user.old_email, sobject: 'Mail is changed.')
    mail(to: @user.email, subject: 'Mail is changed.')
  end
end
