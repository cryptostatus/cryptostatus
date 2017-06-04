class Balance < ApplicationRecord
  enum strategy: {
    seller: 0,
    buyer: 1
  }

  attr_accessor :invested

  belongs_to :user

  validates :user, :amount, :price_per_item, :profit_percent, :strategy,
            :invested, presence: true

  before_validation :set_price_per_item

  private

  def set_price_per_item
    self.price_per_item = invested / amount
  end
end
