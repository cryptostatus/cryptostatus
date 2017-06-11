# frozen_string_literal: true

class Currency < ApplicationRecord
  include Currencies

  scope :order_by_time, -> { order('created_at') }
end
