# frozen_string_literal: true

require 'sidekiq-scheduler'

class DailyPostWorker
  include Sidekiq::Worker

  def perform(provider)
    DailyPost.call(provider)
  end
end
