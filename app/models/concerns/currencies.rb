# frozen_string_literal: true

module Currencies
  extend ActiveSupport::Concern

  included do
    enum name: {
      BTC: 0,
      ETH: 1,
      LTC: 2,
      REP: 3,
      ZEC: 4,
      XMR: 5,
      ETC: 6,
      XRP: 7,
      DASH: 8,
      STR: 9,
      LSK: 10,
      MAID: 11,
      FCT: 12,
      XEM: 13,
      STEEM: 14,
      DOGE: 15,
      BTS: 16,
      GAME: 17,
      ARDR: 18,
      DCR: 19,
      SJCX: 20,
      SC: 21,
      GNT: 22,
      BCH: 23
    }
  end
end
