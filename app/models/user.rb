class User < ApplicationRecord
  attr_accessor :old_email

  has_secure_password
  validates :name, presence: true
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  mount_uploader :image, ImageUploader

  after_update :send_email_changed
  after_create :send_welcome_mail

  private

  def send_welcome_mail
    UserMailer.with(user: self, f: 'text').welcome_mail.deliver_now
    UserMailer.with(user: self, f: 'html').welcome_mail.deliver_now
  end

  def send_email_changed
    return unless old_email != email

    UserMailer.with(user: self).email_changed.deliver_now
  end
end
