class Currency < ApplicationRecord
  include Currencies

  scope :last_by_time, -> { order(:created_at).last }
end
