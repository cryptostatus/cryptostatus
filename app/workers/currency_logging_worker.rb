# frozen_string_literal: true

class CurrencyLoggingWorker
  include Sidekiq::Worker

  def perform
    CurrencyTracker.call
    ProfitChecker.call
  end
end
