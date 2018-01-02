# frozen_string_literal: true

class Devise::MailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/take_profit_email
  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(User.first, subject: 'Reset instructions')
  end
end
