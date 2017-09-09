class ReportQuery
  class << self
    def max_growth
      report.order('max_diff desc').limit(1).first
    end

    def max_drop
      report.order('min_diff asc').limit(1).first
    end

    private

    def report
      @report ||= Currency.select(:name, :price, 'MAX(yesterday_currencies.price) - MAX(currencies.price) as max_diff', 'MIN(yesterday_currencies.price) - MIN(currencies.price) as min_diff')
                          .joins("INNER JOIN (#{yesterday_currencies.to_sql}) AS yesterday_currencies ON currencies.name = yesterday_currencies.name")
                          .where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
                          .group(:name, :price)
    end

    def yesterday_currencies
      range_day = Date.yesterday.beginning_of_day..Date.yesterday.end_of_day
      @yesterday_currencies ||= Currency.select(:name, :created_at, :price).where(created_at: range_day)
    end
  end
end
