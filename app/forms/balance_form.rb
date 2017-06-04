class BalanceForm < Rectify::Form
  attribute :user_id, Integer
  validates :user_id, presence: true

  attribute :strategy, String
  validates :strategy, presence: true

  %i[amount invested price_per_item profit_percent].each do |name|
    attribute name, Float
    validates name, presence: true
  end
end
