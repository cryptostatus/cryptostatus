class Currency < ApplicationRecord
  enum name: {
    BTC: 0
  }

  scope :last_by_time, -> { order(:created_at).last }
end
