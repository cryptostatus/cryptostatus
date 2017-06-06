class BalanceForm < Rectify::Form
  attribute :user_id, Integer
  attribute :strategy, String
  attribute :name, String
  attribute :amount, Float
  attribute :invested, Float
  attribute :price_per_item, Float
  attribute :profit_percent, Float

  def attributes
    self.price_per_item = invested * 1.0 / amount
    self.profit_percent = profit_percent / 100.0

    super.except(:invested)
  end
end
