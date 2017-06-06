# frozen_string_literal: true

class BalanceSerializer < Operators::Serializer
  def as_json
    {
      id: id,
      amount: amount,
      strategy: strategy,
      price_per_item: price_per_item,
      profit_percent: profit_percent
    }
  end
end
