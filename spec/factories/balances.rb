# frozen_string_literal: true

FactoryGirl.define do
  factory :balance do
    user
    name 'BTC'
    amount { rand(1..100) }
    price_per_item { rand(1..100) }
    profit_percent { rand(1..100) / 100 }

    trait :buyer do
      strategy 'buyer'
    end
  end
end
