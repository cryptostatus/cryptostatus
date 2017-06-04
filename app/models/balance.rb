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

  def notify!
    update!(:notified_at, Time.zone.now)
  end

  private

  def set_price_per_item
    self.price_per_item = invested / amount
  end

  scope :profitable, -> (actual) { where('price_per_item * (1 + profit_percent) <= ?', actual) }
  scope :notifiable, -> { where('notified_at IS NULL OR notified_at < ?', 25.minutes.ago) }
end
