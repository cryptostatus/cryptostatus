# frozen_string_literal: true

class ReportQuery
  attr_reader :yesterday_data, :today_data

  def initialize
    @yesterday_data = fetch_prices(Date.yesterday.beginning_of_day..Date.yesterday.end_of_day)
    @today_data = fetch_prices((Time.now.utc - 1.minute)..Date.today.end_of_day)
  end

  def call
    diff = growth_diff

    growth_name = diff.max_by { |_name, info| info[:max] }[0]
    drop_name = diff.min_by { |_name, info| info[:min] }[0]

    {
      max_growth: { name: growth_name, price: today_data[growth_name][:price] },
      max_drop: { name: drop_name, price: today_data[drop_name][:price] }
    }
  end

  private

  def growth_diff
    yesterday_data.merge(today_data) do |_name, yesterday, today|
      { max: yesterday[:max] - today[:max], min: yesterday[:min] - today[:min] }
    end
  end

  def fetch_prices(range_day)
    data = Currency.select(:name, :price, 'MAX(currencies.price) as max_price', 'MIN(currencies.price) as min_price')
                   .group(:name, :price)
                   .where(created_at: range_day)

    data.map do |currency|
      [currency.name, { max: currency.max_price, min: currency.min_price, price: currency.price }]
    end.to_h
  end
end
