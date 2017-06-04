module Currencies
  extend ActiveSupport::Concern

  included do
    enum name: {
      BTC: 0
    }
  end
end
