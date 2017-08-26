# frozen_string_literal: true

require 'sidekiq-scheduler'

class CurrencyLoggingWorker
  include Sidekiq::Worker

  def perform
    CurrencyTracker.call
    ProfitChecker.call
  end
end
