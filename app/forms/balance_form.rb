# frozen_string_literal: true

class BalanceForm < ApplicationForm
  attribute :name, String
  attribute :amount, Float
  attribute :invested, Float
  attribute :strategy, String

  attribute :price_per_item, Float
  attribute :profit_percent, Float

  validates :invested, :amount, :price_per_item, :profit_percent, presence: true
  validates :amount, :invested, :profit_percent, numericality: {
    greater_than_or_equal_to: 0.01,
    less_than_or_equal_to: 999999
  }

  def attributes
    super.except(:invested)
  end

  private

  def after_initialize
    self.price_per_item = invested * 1.0 / amount if invested.present? && amount.present?
    self.profit_percent = profit_percent / 100.0 if profit_percent.present?
    self.name = name&.upcase
  end
end
