# frozen_string_literal: true

class BalanceNotifier < Rectify::Command
  def initialize(balance)
    @balance = balance
  end

  def call
    return unless @balance

    @balance.mark_as_notified!

    UserMailer.take_profit_email(@balance).deliver_later
  end
end
