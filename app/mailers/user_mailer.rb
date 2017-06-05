# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def take_profit_email(balance)
    mail(to: balance.user.email)
  end
end
