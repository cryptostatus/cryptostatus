class CurrencyLoggingWorker
  include Sidekiq::Worker

  def perform
    CurrencyTracker.call
    ProfitChecker.call
  end
end
