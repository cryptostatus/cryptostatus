class BalanceSerializer < Operators::Serializer
  def as_json
    {
      id: id,
      amount: amount,
      price_per_item: price_per_item,
      profit_percent: profit_percent,
      strategy: strategy
    }
  end
end
