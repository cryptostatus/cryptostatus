# frozen_string_literal: true

class Balance < ApplicationRecord
  include Currencies

  enum strategy: {
    seller: 0,
    buyer: 1
  }

  belongs_to :user, inverse_of: :balances

  scope :profitable, ->(actual) { where('price_per_item * (1 + profit_percent) <= ?', actual) }
  scope :should_be_notified, -> { where('notified_at IS NULL OR notified_at < ?', 25.minutes.ago) }

  validates :user, :amount, :price_per_item, :profit_percent, :strategy,
            presence: true

  validates :profit_percent, numericality: {
    greater_thanor_equal_to: 0.01
  }

  def mark_as_notified!
    update!(notified_at: Time.zone.now)
  end

  def invested
    price_per_item * amount
  end

  def current_price_per_item
    Currency.public_send(name).order_by_time.last&.price
  end

  def current_balance_price
    current_price_per_item * amount
  end

  def current_profit_percent
    current_price_per_item / price_per_item
  end
end
