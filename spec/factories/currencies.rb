# frozen_string_literal: true

FactoryGirl.define do
  factory :currency do
    name 'BTC'
    price { rand(1..100) }
  end
end
