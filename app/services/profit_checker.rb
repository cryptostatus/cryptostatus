# frozen_string_literal: true

class ProfitChecker < Rectify::Command
  def call
    Currency.names.keys.each do |name|
      currency = Currency.public_send(name).order_by_time.last

      next unless currency

      Balance.public_send(name)
             .profitable(currency.price)
             .should_be_notified.each do |balance|

        BalanceNotifier.call(balance)
      end
    end
  end
end
