class BalanceForm < Rectify::Form
  attribute :user_id, Integer
  validates :user_id, presence: true

  attribute :strategy, String
  validates :strategy, presence: true

  %i[amount invested price_per_item profit_percent].each do |name|
    attribute name, Float
    validates name, presence: true
  end

  def attributes
    super.except(:invested)
  end

  private

  def before_validation
    self.price_per_item = invested * 1.0 / amount
    self.profit_percent = profit_percent / 100.0
  end
end
