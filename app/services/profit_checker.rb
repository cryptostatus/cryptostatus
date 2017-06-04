class ProfitChecker < Rectify::Command
  def call
    Currency.names.keys.each do |name|
      currency = Currency.public_send(name).last_by_time

      next unless currency

      Balance.profitable(currency.price).should_be_notified.each do |balance|
        BalanceNotifier.call(balance, currency)
      end
    end
  end
end
