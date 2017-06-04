class Balance < ApplicationRecord
  enum strategy: {
    seller: 0,
    buyer: 1
  }

  belongs_to :user

  validates :user, :amount, :price_per_item, :profit_percent, :strategy,
            presence: true
end
