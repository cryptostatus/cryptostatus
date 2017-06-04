class Balance < ApplicationRecord
  enum strategy: {
    seller: 0,
    buyer: 1
  }

  belongs_to :user

  scope :profitable, -> (actual) { where('price_per_item * (1 + profit_percent) <= ?', actual) }
  scope :notifiable, -> { where('notified_at IS NULL OR notified_at < ?', 25.minutes.ago) }

  validates :user, :amount, :price_per_item, :profit_percent, :strategy,
            presence: true

  validates :profit_percent, numericality: { greater_thanor_equal_to: 0.001,
                                           less_than_or_equal_to: 1 }

  def notify!
    update!(:notified_at, Time.zone.now)
  end
end
