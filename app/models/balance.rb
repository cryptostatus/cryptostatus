class Balance < ApplicationRecord
  enum strategy: {
    seller: 0,
    buyer: 1
  }

  belongs_to :user

  validates :user, :amount, :price_per_item, :profit_percent, :strategy,
            presence: true

  validates :profit_percent, numericality: { greater_thanor_equal_to: 0.001,
                                           less_than_or_equal_to: 1 }
end
