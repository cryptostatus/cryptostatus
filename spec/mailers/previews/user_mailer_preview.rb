# frozen_string_literal: true

class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/take_profit_email
  def take_profit_email
    balance = Balance.first
    UserMailer.take_profit_email(balance)
  end
end
