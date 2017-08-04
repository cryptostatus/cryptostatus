# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def take_profit_email(balance)
    @balance = balance
    mail(to: balance.user.email, subject: 'You have profit')
  end
end
