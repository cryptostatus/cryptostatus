# frozen_string_literal: true

class BalanceSerializer < Operators::Serializer
  def as_json
    {
      type: 'balances',
      id: id,
      name: name,
      amount: amount,
      strategy: strategy,
      invested: invested.round(2),
      price_per_item: price_per_item.round(2),
      profit_percent: (profit_percent * 100).round(2),
      current_balance_price: current_balance_price.round(2),
      current_price_per_item: current_price_per_item.round(2),
      current_profit_percent: (current_profit_percent * 100).round(2)
    }
  end
end
