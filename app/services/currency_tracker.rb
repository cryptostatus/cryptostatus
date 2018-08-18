# frozen_string_literal: true

class CurrencyTracker < Rectify::Command
  def call
    Currency.names.keys.each do |name|
      Currency.create(name: name, price: prices[name].values.first)
    end
  end

  private

  def prices
    @prices ||= Cryptocompare::Price.find(Currency.names.keys, ['USD'])
  end
end
