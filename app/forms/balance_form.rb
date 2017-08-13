# frozen_string_literal: true

class BalanceForm < ApplicationForm
  attribute :name, String
  attribute :amount, Float
  attribute :invested, Float
  attribute :strategy, String

  attribute :price_per_item, Float
  attribute :profit_percent, Float

  validates :invested, :amount, :price_per_item, :profit_percent, presence: true

  def attributes
    super.except(:invested)
  end

  private

  def after_initialize
    self.price_per_item = invested * 1.0 / amount if invested && amount
    self.profit_percent = profit_percent / 100.0 if profit_percent
    self.name = name&.upcase
  end
end
