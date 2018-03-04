require 'sidekiq-scheduler'

class HistoryCleanupWorker
  include Sidekiq::Worker

  def perform
    HistoryCleanup.call
  end
end
