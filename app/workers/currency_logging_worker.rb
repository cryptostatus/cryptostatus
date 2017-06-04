class CurrencyLoggingWorker
  include Sidekiq::Worker

  def perform
    CurrencyTracker.call
  end
end
