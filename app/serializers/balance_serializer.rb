# frozen_string_literal: true

class BalanceSerializer < Operators::Serializer
  def as_json
    {
      type: 'balances',
      id: id,
      name: name,
      amount: amount,
      strategy: strategy,
      invested: invested,
      price_per_item: price_per_item,
      profit_percent: profit_percent * 100,
      current_balance_price: current_balance_price,
      current_price_per_item: current_price_per_item,
      current_profit_percent: current_profit_percent * 100
    }
  end
end
