# frozen_string_literal: true

class CurrencyTracker < Rectify::Command
  def call
    Currency.names.keys.each do |name|
      Currency.create(name: name, price: prices[name].last)
    end
  end

  private

  def prices
    binding.pry
    @prices ||= Lionshare::Client.new.prices.get(period: :hour)['data']
  end
end
