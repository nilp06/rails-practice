class UserMailer < ApplicationMailer
  default from: ENV['email']
  def welcome_mail
    @user = params[:user]
  end
end
