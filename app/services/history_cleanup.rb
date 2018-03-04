class HistoryCleanup
  def self.call
    60.times do
      Currency.limit(1000).destroy_all
    end
  end
end
