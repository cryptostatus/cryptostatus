# frozen_string_literal: true

class BalanceForm < ApplicationForm
  attribute :name, String
  attribute :amount, Float
  attribute :invested, Float
  attribute :strategy, String

  attribute :price_per_item, Float
  attribute :profit_percent, Float

  def attributes
    super.except(:invested)
  end

  private

  def after_initialize
    self.price_per_item = invested * 1.0 / amount
    self.profit_percent = profit_percent / 100.0
  end
end
