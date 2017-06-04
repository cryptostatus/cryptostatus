class CurrencyTracker < Rectify::Command
  def call
    Currency.names.keys.each do |type|
      Currency.create(name: type, price: prices[type].last)
    end
  end

  private

  def prices
    @prices ||= Lionshare::Client.new.prices.get(period: :hour)['data']
  end
end
