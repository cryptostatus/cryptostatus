# frozen_string_literal: true

class UserMailer < ApplicationMailer
  include MailerHelper

  def take_profit_email(balance)
    @balance = balance
    @inactivate_balance_url = url_with_params(ENV['CLIENT_BALANCES'], delete_id: @balance.id)
    mail(to: balance.user.email, subject: 'Your investments have grown')
  end
end
